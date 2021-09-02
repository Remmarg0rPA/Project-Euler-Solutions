module Main where

{-
Names scores
Problem 22
Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
-}

import Data.Char
import Data.List 
import Data.List.Split


solve :: [String] -> Int
solve names = _solve 0 names 
    where 
        _solve idx []     = 0
        _solve idx (n:ns) = (nameScore n)*(idx+1) + _solve (idx+1) ns
        nameScore []      = 0
        nameScore (c:cs)  = (ord c - 64) + nameScore cs


main :: IO ()
main = 
    do
    file <- readFile "p022_names.txt"
    let names1 = splitOn "," file
    let names2 = map (\ w -> take ((length w) - 2) . drop 1 $ w) names1
    let names = sort names2
    print $ solve names
    