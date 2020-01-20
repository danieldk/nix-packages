{ config
, stdenv
, fetchzip
, lib

, autoPatchelfHook

, cudaSupport ? config.cudaSupport or false,
  nvidia_x11
}:

let
  archives = {
    x86_64-darwin-cpu = {
      url = "https://download.pytorch.org/libtorch/cpu/libtorch-macos-1.4.0.zip";
      sha256 = "0r6p8k4k28npczq6wj3jj0zgfglys3jilhln5hy75bp8a4w8jix6";
    };
    x86_64-linux-gpu = {
      url = "https://download.pytorch.org/libtorch/cu101/libtorch-cxx11-abi-shared-with-deps-1.4.0.zip";
      sha256 = "0cnix6lz257q9nrvzl45ya2r6slfk6w5kxag6b19drsynvyr8zw8";
    };
    x86_64-linux-cpu = {
      url = "https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.4.0%2Bcpu.zip";
      sha256 = "1bbvsmm29hf0xf6zw6y34cd8ds49wp6n0jg773bpc6735xcycihn";
    };
  };
  device = if cudaSupport then "gpu" else "cpu";
  src = archives."${stdenv.targetPlatform.system}-${device}" or unavailable;
  unavailable = throw "libtorch is not available for this platform";
in stdenv.mkDerivation {
  pname = "libtorch";
  version = "1.4.0";

  src = fetchzip src;

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    stdenv.cc.cc
  ] ++ lib.optionals cudaSupport [ nvidia_x11 ];

  dontBuild = true;
  dontConfigure = true;
  dontStrip = true;

  installPhase = ''
    mkdir -p $out
    cp -r include $out
    cp -r lib $out
  '';
}
