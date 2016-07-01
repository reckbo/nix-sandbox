pkgs: attrs:
  with pkgs;
let defaultAttrs = {
  builder = "${bash}/bin/bash";
  args = [ ./builder2.sh ];
  baseInputs = [ gnutar gzip gnumake clang binutils coreutils gawk gnused gnugrep ];
  buildInputs = [];
  system = builtins.currentSystem;
  };
in
  derivation (defaultAttrs // attrs)
