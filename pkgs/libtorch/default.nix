{ callPackage, nvidia_x11 }:

{
  v1_5_0 = callPackage ./generic.nix rec {
    inherit nvidia_x11;

    libtorchVersion = "1.5.0";
    libtorchArchives = {
      x86_64-darwin-cpu = {
        url = "https://download.pytorch.org/libtorch/cpu/libtorch-macos-${libtorchVersion}.zip";
        sha256 = "1hrhpy4yn8z5sjqwafib2wnla5isx7cg586qv1cbpdcl4am6z8v7";
      };
      x86_64-linux-gpu = {
        url = "https://download.pytorch.org/libtorch/cu101/libtorch-cxx11-abi-shared-with-deps-${libtorchVersion}.zip";
        sha256 = "0yjikkxy9905li2418vnkvv8bggljjb3m22rz0llsd6mk0jlg33m";
      };
      x86_64-linux-cpu = {
        url = "https://download.pytorch.org/libtorch/cpu/libtorch-cxx11-abi-shared-with-deps-${libtorchVersion}%2Bcpu.zip";
        sha256 = "1acz4n7d8k0cjlrysjmls05sdj9klwh0j603pdb2qdq5abclm3dl";
      };
    };
  };
}
