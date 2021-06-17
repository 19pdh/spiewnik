let
  pkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-21.05-small.tar.gz";
    sha256 = "18glj62yy0l917092izcby6pdj56yzq8sdh3c525kbf14zqa7q3j";
  }) { };
in
  with pkgs;
  mkShell {
    buildInputs = [
      python37
      (texlive.combine {
        inherit (texlive) scheme-minimal pdfcrop pdfjam pdfbook2;
      })
      ghostscript
      (callPackage ./nix/neatroff.nix { })
    ];
  }
