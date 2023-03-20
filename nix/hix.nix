{pkgs, ...}: {
  # name = "project-name";
  compiler-nix-name = "ghc927"; # Version of GHC to use

  crossPlatforms = p: pkgs.lib.optionals pkgs.stdenv.hostPlatform.isx86_64 ([
    p.mingwW64
    # p.ghcjs # TODO GHCJS support for GHC 9.2
  ] ++ pkgs.lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    p.musl64
  ]);

  supportHpack = true;

  shell = {
    tools = {
      cabal = "latest";
      hlint = "latest";
      haskell-language-server = "latest";
      hpack = "latest";
      # fourmolu = "latest";
      # stack = "latest";
    };
  };
}
