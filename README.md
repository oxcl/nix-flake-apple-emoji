[简体中文](./README-zh.md) | [Русский](./README-ru.md)

# Apple Emoji Nix

[Nix](https://nixos.org/) flake for [Apple Color Emoji](https://github.com/samuelngs/apple-emoji-ttf) font.

## Installing the Flake

Add the flake as an input in your `flake.nix`:

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.apple-emoji-nix.url = "https://github.com/oxcl/nix-flake-apple-emoji";
  inputs.apple-emoji-nix.inputs.nixpkgs.follows = "nixpkgs";
}
```

Then add the NixOS module in your configuration, OR add the overlay and configure the fonts:

```nix
{
  inputs,
  pkgs,
  ...
}:
{
  # Option 1: Use the NixOS module (recommended)
  imports = [ inputs.apple-emoji-nix.nixosModules.default ];

  # Option 2: Use the overlay directly
  #   pkgs = import nixpkgs {
  #     system = "x86_64-linux";
  #     overlays = [ inputs.apple-emoji-nix.overlays.default ];
  #   };
  #   fonts.packages = [ pkgs.apple-emoji-nix ];
}
```

## Installing with NixOS

Add the NixOS module:

```nix
{
  imports = [ inputs.apple-emoji-nix.nixosModules.default ];
}
```

OR add the overlay and configure fonts manually:

```nix
{
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    overlays = [ inputs.apple-emoji-nix.overlays.default ];
  };
  fonts.packages = [ pkgs.apple-emoji-nix ];
}
```

Rebuild your NixOS system:

```bash
sudo nixos-rebuild switch
```

## Installing with home-manager

Use the overlay in your home-manager configuration:

```nix
{
  programs.home-manager.enable = true;

  nixpkgs.overlays = [ inputs.apple-emoji-nix.overlays.default ];

  home.packages = [ pkgs.apple-emoji-nix ];
}
```

After applying, refresh the font cache:

```bash
fc-cache -fv
```

## License

The Apple Color Emoji font is copyright Apple Inc. This Nix wrapper is provided under the [Apache License 2.0](./LICENSE).