{ config, stdenv
, fetchurl
, patchelf
, cudaSupport ? config.cudaSupport or false, symlinkJoin, cudatoolkit, cudnn, nvidia_x11
}:
with stdenv.lib;
let
  tfType = if cudaSupport then "gpu" else "cpu";
  system =
    if stdenv.isx86_64
    then if      stdenv.isLinux  then "linux-x86_64"
         else if stdenv.isDarwin then "darwin-x86_64" else unavailable
    else unavailable;
  unavailable = throw "libtensorflow is not available for this platform!";
  cudatoolkit_joined = symlinkJoin {
    name = "unsplit_cudatoolkit";
    paths = [ cudatoolkit.out
              cudatoolkit.lib ];};
  rpath = makeLibraryPath ([stdenv.cc.libc stdenv.cc.cc.lib] ++
            optionals cudaSupport [ cudatoolkit_joined cudnn nvidia_x11 ]);
  patchLibs =
    if stdenv.isDarwin
    then ''
      install_name_tool -id $out/lib/libtensorflow.dylib $out/lib/libtensorflow.dylib
      install_name_tool -id $out/lib/libtensorflow_framework.dylib $out/lib/libtensorflow_framework.dylib
    ''
    else ''
      ${patchelf}/bin/patchelf --set-rpath "${rpath}:$out/lib" $out/lib/libtensorflow.so
      ${patchelf}/bin/patchelf --set-rpath "${rpath}" $out/lib/libtensorflow_framework.so
    '';

in stdenv.mkDerivation rec {
  pname = "libtensorflow";
  version = "1.14.0";

  src = fetchurl {
    url =
      if system == "linux-x86_64" then
        "https://blob.danieldk.eu/${pname}/${pname}-${tfType}-${system}-avx-fma-${version}.tar.gz"
      else
        "https://storage.googleapis.com/tensorflow/${pname}/${pname}-${tfType}-${system}-${version}.tar.gz";
    sha256 =
      if system == "linux-x86_64" then
        if cudaSupport
        then "0lm83836ywpzy8ikw4k4k9s9955vqa4dj1xk9rjl3z1xf6ciaiyk"
        else "1xcgkls4hrxgdhnap4ngnda3l8a0b6fp41xp2xpmmm51rbgfzs90"
      else if system == "darwin-x86_64" then
        if cudaSupport
        then unavailable
        else "0zsd5ils1a17j6jzh0c7q1z56fw46gkzybbnms7h2rgg8al0rh92"
      else unavailable;
  };

  # Patch library to use our libc, libstdc++ and others
  buildCommand = ''
    . $stdenv/setup
    mkdir -pv $out
    tar -C $out -xzf $src
    chmod -R +w $out
    ${patchLibs}

    # Write pkgconfig file.
    mkdir $out/lib/pkgconfig
    cat > $out/lib/pkgconfig/tensorflow.pc << EOF
    Name: TensorFlow
    Version: ${version}
    Description: Library for computation using data flow graphs for scalable machine learning
    Requires:
    Libs: -L$out/lib -ltensorflow
    Cflags: -I$out/include/tensorflow
    EOF
  '';

  meta = {
    description = "C API for TensorFlow";
    homepage = https://www.tensorflow.org/versions/master/install/install_c;
    license = licenses.asl20;
    platforms = with platforms; linux ++ darwin;
  };
}
