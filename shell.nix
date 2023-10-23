{ pkgs ? import <nixpkgs> {} }:
with pkgs;
mkShell {
  name = "qmk-dev-shell";
  buildInputs = [ qmk ];
}
