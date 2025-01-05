{ pkgs ? import <nixpkgs> {} }:

let
  erlang = pkgs.beam.interpreters.erlang_25;
  elixir = pkgs.beam.packages.erlang_25.elixir;
  gleam = pkgs.gleam;
in
pkgs.mkShell {
  buildInputs = [
    erlang
    elixir
    gleam
  ];

  shellHook = ''
    echo "Erlang, Elixir, and Gleam development environment"
    echo "================================================"
    echo "Erlang version: $(erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().' -noshell)"
    echo "Elixir version: $(elixir --version)"
    echo "Gleam version: $(gleam --version)"
    echo ""
    echo "To start Erlang shell, type: erl"
    echo "To start Elixir shell, type: iex"
    echo "To start a new Gleam project, type: gleam new project_name"
    echo "================================================"
  '';
}