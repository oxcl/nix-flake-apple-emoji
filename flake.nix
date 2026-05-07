{
  description = "nix flake for apple-color-emoji font";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.x86_64-linux.apple-emoji-nix = pkgs.callPackage ./default.nix {};

    packages.x86_64-linux.default = self.packages.x86_64-linux.apple-emoji-nix;

    overlays.default = final: prev: {
      apple-emoji-nix = final.callPackage ./default.nix {};
    };

    };
}
