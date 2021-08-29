module Main where

{-
Smallest multiple
Problem 5
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
-}

ans :: Int
ans = foldl1 (\acc x -> acc * (div x (gcd acc x))) [1..20]

main :: IO ()
main = do
    print ans