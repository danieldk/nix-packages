{ callPackage
, fetchurl

, linuxPackages
, cudatoolkit_10_0
, cudnn_cudatoolkit_10_0
}:

{
  v1_14_0 = callPackage ./1_14_0.nix {
    inherit (linuxPackages) nvidia_x11;
    cudatoolkit = cudatoolkit_10_0;
    cudnn = cudnn_cudatoolkit_10_0;
  };

  v1_15_0 =
    let
      # Tensorflow 1.15.0 is compiled with cuDNN 7.5.0, so we have to use
      # 7.y.z where y >= 5.
      cudnn_7_6 = cudnn_cudatoolkit_10_0.overrideAttrs (
        oldAttrs: rec {
          name = "cudatoolkit-${cudatoolkit_10_0.majorVersion}-cudnn-${version}";
          version = "7.6.5";
          src = fetchurl {
            url = "https://developer.download.nvidia.com/compute/redist/cudnn/v${version}/cudnn-${cudatoolkit_10_0.majorVersion}-linux-x64-v${version}.32.tgz";
            sha256 = "1fljnjs62svv36z7hkp4fw1wv9jvndh17dl35jn96aqbbwwmwd98";
          };
        }
      );
    in
      callPackage ./1_15_0.nix {
        inherit (linuxPackages) nvidia_x11;
        cudatoolkit = cudatoolkit_10_0;
        cudnn = cudnn_7_6;
      };
}
