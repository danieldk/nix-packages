{ callPackage

, linuxPackages
, cudatoolkit_10_0
, cudnn_cudatoolkit_10_0,
}:

{
  v1_14_0 = callPackage ./1_14_0.nix {
    inherit (linuxPackages) nvidia_x11;
    cudatoolkit = cudatoolkit_10_0;
    cudnn = cudnn_cudatoolkit_10_0;
  };

  v1_15_0 = callPackage ./1_15_0.nix {
    inherit (linuxPackages) nvidia_x11;
    cudatoolkit = cudatoolkit_10_0;
    cudnn = cudnn_cudatoolkit_10_0;
  };
}
