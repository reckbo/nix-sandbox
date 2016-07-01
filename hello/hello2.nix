  with (import <nixpkgs> {});
  derivation {
    name = "hello";
    builder = "${bash}/bin/bash";
    args = [ ./builder.sh ];
    buildInputs = [ gnutar gzip gnumake clang binutils coreutils gawk gnused gnugrep ];
    src = ./hello-2.9.tar.gz;
    system = builtins.currentSystem;
}
