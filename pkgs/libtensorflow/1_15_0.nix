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
         else unavailable
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
  version = "1.15.0";

  src = fetchurl {
    url = "https://blob.danieldk.eu/${pname}/${pname}-${tfType}-${system}-avx-fma-mkl-${version}.tar.gz";
    sha256 =
      if system == "linux-x86_64" then
        if cudaSupport
        then "1gkx76lc9zi8xcqxm1n2mmf44bb7nc59h9k6szlyas735d500q7f"
        else "07hjfv65vhkw4s849f671r2ixdad7x7cvkm9zsj3pw4xj9rkyk6i"
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
