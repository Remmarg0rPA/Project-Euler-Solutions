module Main where

{-
Lattice paths
Problem 15
Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
-}

width  = 20
height = 20

factorial :: Integer -> Integer
factorial 0 = 1 
factorial n = n * factorial (n-1)

binomial :: Integer -> Integer -> Integer
binomial n k = div (factorial n) (factorial k * factorial (n-k)) 

ans :: Integer
ans = binomial (width + height) width

main :: IO ()
main = print ans