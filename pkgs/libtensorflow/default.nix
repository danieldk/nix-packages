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
    url = "https://blob.danieldk.eu/${pname}/${pname}-${tfType}-${system}-avx-fma-${version}.tar.gz";
    sha256 =
      if system == "linux-x86_64" then
        if cudaSupport
        then "0ygq7ddjd4ahzkjgfjy01zxkczkxy6n5jp3bb75z02nlx87pw3d0"
        else "1xcgkls4hrxgdhnap4ngnda3l8a0b6fp41xp2xpmmm51rbgfzs90"
      else if system == "darwin-x86_64" then
        if cudaSupport
        then unavailable
        else "120lr69f684lfcv5chivkq0xxaf0jjp0i7ms542mb971iji95cmv"
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
