module Paths_timeconsole (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch


version :: Version
version = Version {versionBranch = [0,1,0,0], versionTags = []}
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/alanhawkins/.cabal/bin"
libdir     = "/Users/alanhawkins/.cabal/lib/x86_64-osx-ghc-7.8.2/timeconsole-0.1.0.0"
datadir    = "/Users/alanhawkins/.cabal/share/x86_64-osx-ghc-7.8.2/timeconsole-0.1.0.0"
libexecdir = "/Users/alanhawkins/.cabal/libexec"
sysconfdir = "/Users/alanhawkins/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "timeconsole_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "timeconsole_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "timeconsole_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "timeconsole_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "timeconsole_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
