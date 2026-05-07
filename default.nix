{ pkgs ? import <nixpkgs> {} }: with pkgs; stdenvNoCC.mkDerivation rec {
  pname = "apple-emoji-nix";
  version = "0.0.1";
  src = fetchurl {
    url = "https://github.com/samuelngs/apple-emoji-ttf/releases/latest/download/AppleColorEmoji-Linux.ttf";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
  nativeBuildInputs = [ installFonts ];
  installPhase = ''
    install -Dm755 $src $out/share/fonts/truetype/AppleColorEmoji.ttf
  '';
  meta = with lib; {
    description = "Apple Emoji font for linux";
    homepage = "https://github.com/samuelngs/apple-emoji-ttf";
  };
}
