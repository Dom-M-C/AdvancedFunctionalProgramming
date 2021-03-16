# AdvancedFunctionalProgramming
Following the exercises &amp; lectures for advanced functional programming outlined [here](http://www.cs.nott.ac.uk/~pszgmh/afp.html)


## nix

[Nix]() is used as the package manager for the project, following the instructions [here](https://maybevoid.com/posts/2019-01-27-getting-started-haskell-nix.html)


For a new project, run cabal inside a Nix sandbox:
```
nix-shell --pure -p ghc cabal-install --run "cabal init"
```
Use cabal2nix command to generate a `default.nix` file.
```
nix-shell --pure -p cabal2nix --run "cabal2nix ." > default.nix
```
Each time the `.cabal` file is updated `default.nix` needs to be regenerated.

Use the `release.nix` file to build a binary into `result/bin`
```
nix-build release.nix
```

Use `nix-shell` to enter a shell with dependencies in `default.nix` installed
```
nix-shell --attr env release.nix
```

## nix todo

https://github.com/Gabriel439/haskell-nix
https://cah6.github.io/technology/nix-haskell-1/
