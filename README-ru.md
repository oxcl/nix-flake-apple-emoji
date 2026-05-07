# Apple Emoji Nix

[Flake](https://nixos.org/) для шрифта [Apple Color Emoji](https://github.com/samuelngs/apple-emoji-ttf).

## Установка Flake

Добавьте flake как ввод в ваш `flake.nix`:

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.apple-emoji-nix.url = "https://github.com/oxcl/nix-flake-apple-emoji";
  inputs.apple-emoji-nix.inputs.nixpkgs.follows = "nixpkgs";
}
```

## Установка в NixOS

Добавьте overlay и настройте шрифты:

```nix
{
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    overlays = [ inputs.apple-emoji-nix.overlays.default ];
  };
  fonts.packages = [ pkgs.apple-emoji-nix ];
}
```

Пересоберите систему NixOS:

```bash
sudo nixos-rebuild switch
```

## Установка в home-manager

Используйте overlay в конфигурации home-manager:

```nix
{
  programs.home-manager.enable = true;

  nixpkgs.overlays = [ inputs.apple-emoji-nix.overlays.default ];

  home.packages = [ pkgs.apple-emoji-nix ];
}
```

После применения обновите кэш шрифтов:

```bash
fc-cache -fv
```

## Лицензия

Шрифт Apple Color Emoji является собственностью Apple Inc. Данная Nix-обёртка распространяется по [лицензии Apache License 2.0](./LICENSE).