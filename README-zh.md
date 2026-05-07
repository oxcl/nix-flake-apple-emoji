# Apple Emoji Nix

用于 [Apple Color Emoji](https://github.com/samuelngs/apple-emoji-ttf) 字体的 [Nix](https://nixos.org/) flake。

## 安装 Flake

在您的 `flake.nix` 中添加 flake 作为输入：

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs";
  inputs.apple-emoji-nix.url = "https://github.com/oxcl/nix-flake-apple-emoji";
  inputs.apple-emoji-nix.inputs.nixpkgs.follows = "nixpkgs";
}
```

然后在您的配置中添加 NixOS 模块，或者添加 overlay 并手动配置字体：

```nix
{
  inputs,
  pkgs,
  ...
}:
{
  # 方法 1：使用 NixOS 模块（推荐）
  imports = [ inputs.apple-emoji-nix.nixosModules.default ];

  # 方法 2：直接使用 overlay
  #   pkgs = import nixpkgs {
  #     system = "x86_64-linux";
  #     overlays = [ inputs.apple-emoji-nix.overlays.default ];
  #   };
  #   fonts.packages = [ pkgs.apple-emoji-nix ];
}
```

## 在 NixOS 上安装

添加 NixOS 模块：

```nix
{
  imports = [ inputs.apple-emoji-nix.nixosModules.default ];
}
```

或者添加 overlay 并手动配置字体：

```nix
{
  pkgs = import nixpkgs {
    system = "x86_64-linux";
    overlays = [ inputs.apple-emoji-nix.overlays.default ];
  };
  fonts.packages = [ pkgs.apple-emoji-nix ];
}
```

重新构建 NixOS 系统：

```bash
sudo nixos-rebuild switch
```

## 在 home-manager 上安装

在 home-manager 配置中使用 overlay：

```nix
{
  programs.home-manager.enable = true;

  nixpkgs.overlays = [ inputs.apple-emoji-nix.overlays.default ];

  home.packages = [ pkgs.apple-emoji-nix ];
}
```

应用后刷新字体缓存：

```bash
fc-cache -fv
```

## 许可证

Apple Color Emoji 字体版权归 Apple Inc. 所有。此 Nix 包装程序基于 [Apache License 2.0](./LICENSE) 提供。