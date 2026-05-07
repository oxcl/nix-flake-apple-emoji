{ pkgs ? import <nixpkgs> {} }: with pkgs; stdenvNoCC.mkDerivation rec {
  pname = "apple-emoji-nix";
  version = "26.0.0";
  src = fetchurl {
    url = "https://github.com/samuelngs/apple-emoji-ttf/releases/download/macos-26-20260219-2aa12422/AppleColorEmoji-Linux.ttf";
    hash = "sha256-U1oEOvBHBtJEcQWeZHRb/IDWYXraLuo0NdxWINwPUxg=";
  };
  dontUnpack = true;
  nativeBuildInputs = [ installFonts ];
  installPhase = ''
    install -Dm755 $src $out/share/fonts/truetype/AppleColorEmoji.ttf
  '';
  meta = with lib; {
    description = "Apple Emoji font for linux";
    homepage = "https://github.com/samuelngs/apple-emoji-ttf";
  };
}
