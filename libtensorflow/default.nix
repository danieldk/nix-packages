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
      install_name_tool -id $out/lib/libtensorflow.so $out/lib/libtensorflow.so
      install_name_tool -id $out/lib/libtensorflow_framework.so $out/lib/libtensorflow_framework.so
    ''
    else ''
      ${patchelf}/bin/patchelf --set-rpath "${rpath}:$out/lib" $out/lib/libtensorflow.so
      ${patchelf}/bin/patchelf --set-rpath "${rpath}" $out/lib/libtensorflow_framework.so
    '';

in stdenv.mkDerivation rec {
  pname = "libtensorflow";
  version = "1.13.1";

  src = fetchurl {
    url =
      if system == "linux-x86_64" then
        "https://blob.danieldk.eu/${pname}/${pname}-${tfType}-${system}-avx-fma-${version}.tar.gz"
      else
        "https://storage.googleapis.com/tensorflow/${pname}/${pname}-${tfType}-${system}-${version}.tar.gz";
    sha256 =
      if system == "linux-x86_64" then
        if cudaSupport
        then "16i0wsh9zb5gjqx8n86d8y8ww71awxn1mdbac5nbhkrca0r533km"
        else "1zdzd36mz1cjjanq9rxb1g6lfdxl3mvr603v56vsaz12x2b9szbn"
      else if system == "darwin-x86_64" then
        if cudaSupport
        then unavailable
        else "0mv0xrnkb871l6j6gpdq84aq5987sabszggl1jyws4hvacipidmq"
      else unavailable;
  };

  # Patch library to use our libc, libstdc++ and others
  buildCommand = ''
    . $stdenv/setup
    mkdir -pv $out
    tar -C $out -xzf $src
    chmod +w $out/lib/libtensorflow.so
    chmod +w $out/lib/libtensorflow_framework.so
    ${patchLibs}
    chmod -w $out/lib/libtensorflow.so
    chmod -w $out/lib/libtensorflow_framework.so

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
