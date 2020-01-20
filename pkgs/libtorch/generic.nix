{ config
, stdenv
, fetchzip
, lib

, autoPatchelfHook

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

  meta = with stdenv.lib; {
    description = "C++ API of the PyTorch machine learning framework";
    homepage = "https://pytorch.org";
    license = licenses.bsd3;
    platforms = with platforms; linux ++ darwin;
  };
}
