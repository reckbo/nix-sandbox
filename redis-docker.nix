{ pkgs ? import <nixpkgs> {} }:

with pkgs;

let 
  debianImage = dockerTools.pullImage {
    imageName = "debian";
    sha256 = "08w22gx6hmmq75rybqzrxs03nzq2k39lrcj291yhsc08p9d9l9cj";
  };
in

dockerTools.buildImage {
    name = "redis";
    tag = "latest";

    fromImage = debianImage;

    contents = pkgs.redis; 
    runAsRoot = ''
      #!${stdenv.shell}
      mkdir -p /data
    '';

    config = {
      Cmd = [ "/bin/redis-server" ];
      WorkingDir = "/data";
      Volumes = {
        "/data" = {};
      };
    };
  }
