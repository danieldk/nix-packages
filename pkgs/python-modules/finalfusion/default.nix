{ stdenv, callPackage, defaultCrateOverrides, fetchFromGitHub
, darwin, numpy, python, pytest }:

let
  mozillaOverlay = fetchFromGitHub {
    owner = "mozilla";
    repo = "nixpkgs-mozilla";
    rev = "9f35c4b09fd44a77227e79ff0c1b4b6a69dff533";
    sha256 = "18h0nvh55b5an4gmlgfbvwbyqj91bklf1zymis6lbdh75571qaz0";
  };
  mozilla = callPackage "${mozillaOverlay.out}/package-set.nix" { };
  rustNightly = (mozilla.rustChannelOf { date = "2019-02-07"; channel = "nightly"; }).rust;
  src = fetchFromGitHub {
    owner = "finalfusion";
    repo = "finalfusion-python";
    rev = "0.4.0";
    sha256 = "1q896pnaar61c2p8w8wikm79c4ghmzsg3y12i17nzb2xr546p7l2";
  };
in ((callPackage ./finalfusion.nix {}).finalfusion_python {}).override {
  rust = rustNightly;

  crateOverrides = defaultCrateOverrides // {
    finalfusion-python = attr: {
      inherit src;

      buildInputs = stdenv.lib.optional stdenv.isDarwin darwin.Security;

      propagatedBuildInputs = [ numpy ];

      installCheckInputs = [ pytest ];

      doInstallCheck = true;

      installPhase = let
        sitePackages = python.sitePackages;
        sharedLibrary = stdenv.hostPlatform.extensions.sharedLibrary;
      in ''
        mkdir -p "$out/${sitePackages}"
        cp target/lib/libfinalfusion-*${sharedLibrary} \
          "$out/${sitePackages}/finalfusion.so"
        export PYTHONPATH="$out/${sitePackages}:$PYTHONPATH"
      '';

      installCheckPhase = ''
        pytest
      '';

      meta = with stdenv.lib; {
        description = "Python module for the finalfusion embedding format";
        license = licenses.asl20;
        platforms = platforms.all;
      };
    };

    pyo3 = attr: {
      buildInputs = [ python ];
    };
  };
}
