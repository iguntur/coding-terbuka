{
  description = "Coding shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";

    # Input for Vite+
    nix-vite-plus.url = "github:ryoppippi/nix-vite-plus";
    nix-vite-plus.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } {
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    perSystem = { self', inputs', system, config, pkgs, ... }: {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (python314.withPackages (p: with p; [
            jupyterlab
            pandas
            numpy
            graphviz
            matplotlib
            tkinter
          ]))

          sqlite # Self-contained, serverless, zero-configuration, transactional SQL database engine
          ruff # Extremely fast Python linter and code formatter
          # uv # Extremely fast Python package installer and resolver, written in Rust
          nodejs # Event-driven I/O framework for the V8 JavaScript engine
          pnpm

          inputs'.nix-vite-plus.packages.vp
        ];
      };
    };
  };
}
