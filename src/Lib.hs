{-# LANGUAGE ForeignFunctionInterface #-}
module Lib
    ( loadFile
    , freePlayer
    ) where

import Foreign
import Foreign.C.String

foreign import ccall "core.h load_file" c_load_file :: CString -> IO()
foreign import ccall "core.h free_player" c_free_player :: IO()

loadFile :: String -> IO()
loadFile name = withCString name $ \c_str -> c_load_file c_str

freePlayer :: IO()
freePlayer = c_free_player