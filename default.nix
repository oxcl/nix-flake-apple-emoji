{ pkgs ? import <nixpkgs> {}, apple_color_emoji_font }: with pkgs; stdenvNoCC.mkDerivation rec {
  pname = "apple-emoji-nix";
  version = "0.0.1";
  dontBuild = true;
  dontUnpack = true;
  installPhase = ''
    install -Dm755 ${apple_color_emoji_font} $out/share/fonts/truetype/AppleColorEmoji.ttf
  '';
  meta = with lib; {
    description = "Apple Emoji font for linux";
    homepage = "https://github.com/samuelngs/apple-emoji-linux";
  };
}
