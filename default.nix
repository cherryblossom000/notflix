{ pkgs ? import <nixpkgs> {} }: pkgs.writeTextFile rec {
  name = "notflix";
  executable = true;
  destination = "/bin/${name}";
  text = ''
    #!${pkgs.elvish}${pkgs.elvish.shellPath}

    set paths = [${builtins.replaceStrings [":"] [" "] (pkgs.lib.makeBinPath [ pkgs.curlMinimal pkgs.skim ])} $@paths]

    ${builtins.readFile ./notflix}
  '';
  meta.mainProgram = name;
}
