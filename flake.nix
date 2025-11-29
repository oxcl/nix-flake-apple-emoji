{
  description = "nix flake for apple-emoji-gtk";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    apple_color_emoji_font = {
      url = "https://github.com/samuelngs/apple-emoji-linux/releases/latest/download/AppleColorEmoji.ttf";
      flake = false;
    };
  };

  outputs = { self, nixpkgs, apple_color_emoji_font }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.x86_64-linux.apple-emoji-nix = pkgs.callPackage ./default.nix { inherit pkgs apple_color_emoji_font; };

    packages.x86_64-linux.default = self.packages.x86_64-linux.apple-emoji-nix;

    overlays.default = final: prev: {
      apple-emoji-nix = self.packages.x86_64-linux.default;
    };
  };
}
