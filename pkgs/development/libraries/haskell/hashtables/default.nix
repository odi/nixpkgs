# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, fetchgit, hashable, primitive, vector }:

cabal.mkDerivation (self: {
  pname = "hashtables";
  version = "1.2.0.1";
  src = fetchgit {
    url = "git://github.com/gregorycollins/hashtables.git";
    sha256 = "1622ba3eb37e72cbedf01ae17162e045ca6506dea8a78750cc85805fe8e86129";
    rev = "a045fa90f4bc3923f38d1b468ce4d3982cef85e0";
  };
  buildDepends = [ hashable primitive vector ];
  meta = {
    homepage = "http://github.com/gregorycollins/hashtables";
    description = "Mutable hash tables in the ST monad";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
