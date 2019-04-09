module Main where

import Lib
import Data.List
import Data.Char (isSpace)
import System.Environment
import Control.Monad

trimBackSlash :: String ->  String
trimBackSlash [] = []
trimBackSlash (x:xs) = if x == '\\' then trimBackSlash xs else x:trimBackSlash xs

trimSpace :: String -> String
trimSpace = dropWhileEnd isSpace . dropWhile isSpace


main :: IO ()
main = do
    name <- getLine
    unless (null name) $
        do 
            print $ "loading file: " ++ trimBackSlash name
            loadFile $ trimBackSlash $ trimSpace name
            main
    freePlayer



