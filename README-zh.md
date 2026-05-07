# Apple Emoji Nix

用于 [Apple Color Emoji](https://github.com/samuelngs/apple-emoji-ttf) 字体的 [Nix](https://nixos.org/) flake。

## 安装 Flake

在您的 `flake.nix` 中添加 flake 作为输入：

```nix
{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  inputs.apple-emoji-nix.url = "https://github.com/oxcl/nix-flake-apple-emoji";
  inputs.apple-emoji-nix.inputs.nixpkgs.follows = "nixpkgs";
}
```

## 在 NixOS 上安装

添加 overlay 并配置字体：

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