{
  description = "A very basic flake with fixed output ifd";

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      hashArgs = {
        outputHashMode = "recursive";
        outputHashAlgo = "sha256";
        outputHash = "0gf6y3p838zr7dlnvp3yhgpphz5b5lh1g8i2k5brmpnxdabgkr4x";
      };
      f = pkgs.runCommand "ifd" hashArgs ''
        cp -Lr ${./ifd} $out
      '';
    in
    {
      defaultPackage.x86_64-linux = pkgs.callPackage "${f}/default.nix" {};
    };
}
