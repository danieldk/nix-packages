{ config
, stdenv
, fetchzip
, lib

, autoPatchelfHook
, fixDarwinDylibNames

, cudaSupport ? config.cudaSupport or false
, nvidia_x11

, libtorchArchives
, libtorchVersion
}:

let
  device = if cudaSupport then "gpu" else "cpu";
  src = libtorchArchives."${stdenv.targetPlatform.system}-${device}" or unavailable;
  unavailable = throw "libtorch is not available for this platform";
in stdenv.mkDerivation {
  pname = "libtorch";
  version = libtorchVersion;

  src = fetchzip src;

  nativeBuildInputs = if stdenv.isDarwin then [ fixDarwinDylibNames ] else [ autoPatchelfHook ];

  buildInputs = [
    stdenv.cc.cc
  ] ++ lib.optionals cudaSupport [ nvidia_x11 ];

  dontBuild = true;
  dontConfigure = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $dev/lib
    cp -r include $dev
    cp -a lib/*.a $dev/lib

    mkdir -p $out/lib
    cp -a lib/*.so* lib/*.dylib $out/lib

    # We do not care about Java support...
    rm -f $out/lib/lib*jni* 2> /dev/null || true
  '';

  postFixup = stdenv.lib.optionalString stdenv.isDarwin ''
    install_name_tool -change @rpath/libshm.dylib $out/lib/libshm.dylib $out/lib/libtorch_python.dylib
    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libtorch_python.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libtorch_python.dylib
    install_name_tool -change @rpath/libtorch.dylib $out/lib/libtorch.dylib $out/lib/libtorch_python.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libtorch_python.dylib

    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libtorch.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libtorch.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libtorch.dylib

    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libtorch_cpu.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libtorch_cpu.dylib

    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libcaffe2_observers.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libcaffe2_observers.dylib
    install_name_tool -change @rpath/libtorch.dylib $out/lib/libtorch.dylib $out/lib/libcaffe2_observers.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libcaffe2_observers.dylib

    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libcaffe2_module_test_dynamic.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libcaffe2_module_test_dynamic.dylib
    install_name_tool -change @rpath/libtorch.dylib $out/lib/libtorch.dylib $out/lib/libcaffe2_module_test_dynamic.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libcaffe2_module_test_dynamic.dylib

    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libcaffe2_detectron_ops.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libcaffe2_detectron_ops.dylib
    install_name_tool -change @rpath/libtorch.dylib $out/lib/libtorch.dylib $out/lib/libcaffe2_detectron_ops.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libcaffe2_detectron_ops.dylib

    install_name_tool -change @rpath/libc10.dylib $out/lib/libc10.dylib $out/lib/libshm.dylib
    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libshm.dylib
    install_name_tool -change @rpath/libtorch.dylib $out/lib/libtorch.dylib $out/lib/libshm.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libshm.dylib

    install_name_tool -change @rpath/libiomp5.dylib $out/lib/libiomp5.dylib $out/lib/libtorch_global_deps.dylib
    install_name_tool -change @rpath/libtorch_cpu.dylib $out/lib/libtorch_cpu.dylib $out/lib/libtorch_global_deps.dylib
  '';

  outputs = [ "out" "dev" ];

  meta = with stdenv.lib; {
    description = "C++ API of the PyTorch machine learning framework";
    homepage = "https://pytorch.org";
    license = licenses.bsd3;
    platforms = with platforms; linux ++ darwin;
  };
}
