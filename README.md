# nixos
Modular style for different machine types and necessary group additions added in.

default.nix for each host will import the necessary files from the modules directory.
everything gets common.nix. 

home for user related pkgs and configs
hosts for individual machines
modules for software packages

flake.nix to orchestrate it all
