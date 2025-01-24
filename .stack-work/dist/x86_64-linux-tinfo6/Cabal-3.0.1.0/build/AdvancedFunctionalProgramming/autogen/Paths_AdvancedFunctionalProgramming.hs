{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_AdvancedFunctionalProgramming (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/dmc/source/AdvancedFunctionalProgramming/.stack-work/install/x86_64-linux-tinfo6/76c4c913d99057be59eae25f6071a30b6497bcd823a992a11dfd381b2d2d26cc/8.8.4/bin"
libdir     = "/home/dmc/source/AdvancedFunctionalProgramming/.stack-work/install/x86_64-linux-tinfo6/76c4c913d99057be59eae25f6071a30b6497bcd823a992a11dfd381b2d2d26cc/8.8.4/lib/x86_64-linux-ghc-8.8.4/AdvancedFunctionalProgramming-0.1.0.0-HjNdJxla6e7KaV6KL5UMMX-AdvancedFunctionalProgramming"
dynlibdir  = "/home/dmc/source/AdvancedFunctionalProgramming/.stack-work/install/x86_64-linux-tinfo6/76c4c913d99057be59eae25f6071a30b6497bcd823a992a11dfd381b2d2d26cc/8.8.4/lib/x86_64-linux-ghc-8.8.4"
datadir    = "/home/dmc/source/AdvancedFunctionalProgramming/.stack-work/install/x86_64-linux-tinfo6/76c4c913d99057be59eae25f6071a30b6497bcd823a992a11dfd381b2d2d26cc/8.8.4/share/x86_64-linux-ghc-8.8.4/AdvancedFunctionalProgramming-0.1.0.0"
libexecdir = "/home/dmc/source/AdvancedFunctionalProgramming/.stack-work/install/x86_64-linux-tinfo6/76c4c913d99057be59eae25f6071a30b6497bcd823a992a11dfd381b2d2d26cc/8.8.4/libexec/x86_64-linux-ghc-8.8.4/AdvancedFunctionalProgramming-0.1.0.0"
sysconfdir = "/home/dmc/source/AdvancedFunctionalProgramming/.stack-work/install/x86_64-linux-tinfo6/76c4c913d99057be59eae25f6071a30b6497bcd823a992a11dfd381b2d2d26cc/8.8.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "AdvancedFunctionalProgramming_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "AdvancedFunctionalProgramming_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "AdvancedFunctionalProgramming_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "AdvancedFunctionalProgramming_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "AdvancedFunctionalProgramming_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "AdvancedFunctionalProgramming_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
