{
  description = "A tool to search and stream torrents.";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachSystem [ "x86_64-darwin" "aarch64-darwin" ] (system:
      let pkgs = import nixpkgs { inherit system; };
      in rec {
        packages.notflix = (import ./.) { inherit pkgs; };
        defaultPackage = packages.notflix;
        apps.notflix = flake-utils.lib.mkApp { drv = packages.notflix; };
        defaultApp = apps.notflix;
      }
    );
}
