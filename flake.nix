{
  description = "NUR packages for konfi";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      legacyPackages = forAllSystems (system:
        import ./default.nix {
          pkgs = import nixpkgs { inherit system; };
        });

      packages = forAllSystems (system: self.legacyPackages.${system});
    };
}
