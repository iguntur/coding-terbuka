{
  description = "Coding shell";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs = inputs@{ flake-parts, ... }: flake-parts.lib.mkFlake { inherit inputs; } ({ ... }: {
    systems = [
      "aarch64-darwin"
      "aarch64-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];

    perSystem = { config, pkgs, ... }: {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          (pkgs.python313.withPackages (p: with p; [
            jupyterlab
            pandas
            numpy
            graphviz
            matplotlib
            tkinter
          ]))

          sqlite
          ruff # Extremely fast Python linter and code formatter
          uv # Extremely fast Python package installer and resolver, written in Rust
          nodejs # Event-driven I/O framework for the V8 JavaScript engine
        ];
      };
    };
  });
}
