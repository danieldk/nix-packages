{ callPackage, nvidia_x11 }:

{
  v1_3_1 = callPackage ./generic.nix {
    inherit nvidia_x11;

    libtorchVersion = "1.3.1";
    libtorchArchives = {
      x86_64-darwin-cpu = {
        url = "https://download.pytorch.org/libtorch/cpu/libtorch-macos-1.3.1.zip";
        sha256 = "0picyiywgqa1l8qcvij381d6z0lbpn864br2rzsw1g8g6rg6invg";
      };
      x86_64-linux-gpu = {
        url = "https://download.pytorch.org/libtorch/cu101/libtorch-cxx11-abi-shared-with-deps-1.3.1.zip";
        sha256 = "1rxpgwi88pi42g8881nlyqdhmzjl51iax7hv93x4wd99iwdd1yva";
      };
      x86_64-linux-cpu = {
        url = "https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-1.3.1%2Bcpu.zip";
        sha256 = "1v76l70wsyal8d41w00mnhg9ykd647z1a5h545x02wfi1d9cmanw";
      };
    };
  };

  v1_4_0 = callPackage ./generic.nix {
    inherit nvidia_x11;

    libtorchVersion = "1.4.0";
    libtorchArchives = {
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
  };
}
