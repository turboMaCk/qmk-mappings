{ pkgs ? import <nixpkgs> {} }:
with pkgs;
mkShell {
  name = "qmk-dev-shell";
  buildInputs = [ qmk ];
  shellHook = ''
    FAKEHOME=$(pwd)/.home
    mkdir -p $FAKEHOME/.config/qmk

    # Generate ini file
    cat << EOF > $FAKEHOME/.config/qmk/qmk.ini
    [user]
    qmk_home = $(pwd)/qmk_firmware

    [config]

    [console]

    [cformat]

    [compile]

    [docs]

    [flash]

    [hello]

    [info]

    [lint]

    [list_keymaps]

    [kle2json]

    [new_keymap]

    [general]
    EOF
  '';
}
