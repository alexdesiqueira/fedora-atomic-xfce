{
  description = "Dev shell for Vauxite";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    bluebuild.url = "github:blue-build/cli";
  };

  outputs = { self, nixpkgs, bluebuild }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          bluebuild.packages.${system}.bluebuild
        ];
      };
    };
}
