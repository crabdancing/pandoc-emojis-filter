with (import <nixpkgs> {}); rec {
  pandoc-emojis-filter = mkYarnPackage {
    name = "pandoc-emojis-filter";
    src = ./.;
    packageJSON = ./package.json;
    yarnLock = ./yarn.lock;
    yarnNix = ./yarn.nix;
  };
}
