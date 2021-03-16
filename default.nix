{ mkDerivation, base, stdenv }:
mkDerivation {
  pname = "AdvancedFunctionalProgramming";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base ];
  license = "unknown";
  hydraPlatforms = stdenv.lib.platforms.none;
}
