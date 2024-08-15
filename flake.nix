{
  description = "Flake for building pandoc-emojis-filter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        packages = let
          pandoc-emojis-filter = pkgs.callPackage ./pkg.nix {};
        in {
          inherit pandoc-emojis-filter;
          default = pandoc-emojis-filter;
        };
      };
    };
}
