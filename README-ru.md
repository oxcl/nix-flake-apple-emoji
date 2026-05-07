# Apple Emoji Nix

[Flake](https://nixos.org/) для шрифта [Apple Color Emoji](https://github.com/samuelngs/apple-emoji-ttf).

## Установка Flake

Добавьте flake как ввод в ваш `flake.nix`:

```nix
{
  inputs.apple-emoji-nix.url = "https://github.com/oxcl/nix-flake-apple-emoji";
}
```

Затем добавьте NixOS модуль в вашу конфигурацию, ИЛИ добавьте overlay и настройте шрифты вручную:

```nix
{
  inputs,
  pkgs,
  ...
}:
{
  # Вариант 1: Использование NixOS модуля (рекомендуется)
  imports = [ inputs.apple-emoji-nix.nixosModules.default ];

  # Вариант 2: Использование overlay напрямую
  #   pkgs = import nixpkgs {
  #     system = "x86_64-linux";
  #     overlays = [ inputs.apple-emoji-nix.overlays.default ];
  #   };
  #   fonts.packages = [ pkgs.apple-emoji-nix ];
}
```

## Установка в NixOS

Добавьте NixOS модуль:

```nix
{
  imports = [ inputs.apple-emoji-nix.nixosModules.default ];
}
```

ИЛИ добавьте overlay и настройте шрифты вручную:

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