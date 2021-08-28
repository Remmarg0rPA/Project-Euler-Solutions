module Main where

{-
Largest prime factor
Problem 3
The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
-}


factor :: Int -> [Int]
factor 1 = []
factor x = smallestFactor : (factor $ div x smallestFactor)
    where
        smallestFactor :: Int
        smallestFactor = head [n | n <- [2..x], mod x n == 0]


ans :: Int
ans = last $ factor 600851475143


main :: IO () 
main = do
    print ans