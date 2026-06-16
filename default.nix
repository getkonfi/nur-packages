{ pkgs ? import <nixpkgs> { } }:

let
  konfiPath = ./pkgs/konfi;
in
if builtins.pathExists konfiPath then {
  konfi = pkgs.callPackage konfiPath { };
} else { }
