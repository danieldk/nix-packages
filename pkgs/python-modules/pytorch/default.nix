{ lib
, stdenv
, buildPythonPackage
, fetchurl

# Native build inputs
, autoPatchelfHook
, fixDarwinDylibNames
, python

# Build inputs
, cudatoolkit
, nvidia_x11

# Propagated build inputs
, numpy

, cudaSupport ? false
}:

let
  unavailable = throw "pytorch is not available for this platform!";
  pythonMinor = "cp${python.sourceVersion.major}${python.sourceVersion.minor}";
  pythonAbi = if stdenv.isDarwin then
    "${pythonMinor}-none"
  else
    "${pythonMinor}-${pythonMinor}m";
  system = if python.system == "x86_64-linux" then "linux_x86_64"
  else if python.system == "x86_64-darwin" then "macosx_10_9_x86_64"
  else unavailable;
  # "10.1" -> "101"
  shortCudaVersion = builtins.replaceStrings [ "." ] [ "" ] cudatoolkit.majorVersion;
  cudaVersion = if cudaSupport then "cu${shortCudaVersion}" else "cpu";
  version = "1.4.0";
  dlVersion = if cudaSupport || stdenv.isDarwin then version else "${version}%2Bcpu";
  hashes = import ./hashes.nix;
  
in buildPythonPackage rec {
  inherit version;

  pname = "pytorch";
  format = "wheel";
  disabled = !python.isPy37;

  src = fetchurl {
    name = "torch-${version}-${pythonAbi}-${system}.whl";
    url = "https://download.pytorch.org/whl/${cudaVersion}/torch-${dlVersion}-${pythonAbi}-${system}.whl";
    sha256 = hashes."${pythonAbi}-${system}-${cudaVersion}" or unavailable;
  };

  nativeBuildInputs = [ autoPatchelfHook ] ++
    lib.optional stdenv.isDarwin [fixDarwinDylibNames ];

  buildInputs = [ stdenv.cc.cc ] ++
    lib.optionals cudaSupport [ cudatoolkit.lib cudatoolkit.out nvidia_x11 ];

  propagatedBuildInputs = [ numpy ];

  dontStrip = true;

  meta = with stdenv.lib; {
    description = "PyTorch machine learning framework";
    homepage = "https://pytorch.org/";
    license = licenses.bsd3;
    platforms = [ "x86_64-darwin" "x86_64-linux" ];
  };
}
