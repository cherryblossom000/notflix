{ pkgs ? import <nixpkgs> {} }: pkgs.writeShellApplication {
  name = "notflix";
  text = builtins.readFile ./notflix;
  runtimeInputs = with pkgs; [ coreutils curlMinimal gnugrep skim ];
}
