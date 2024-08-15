{
  description = "Flake for building pandoc-emojis-filter";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstaable";
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
        packages = {
          defaultPackage = pkgs.callPackage ./pkg.nix {};
        };
      };
    };
}
