module Main where

{-
Longest Collatz sequence
Problem 14
The following iterative sequence is defined for the set of positive integers:

n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million.
-}

collatzLength :: Integer -> Integer
collatzLength n 
    | n == 1    = 1
    | even n    = 1 + collatzLength (div n 2)
    | otherwise = 1 + collatzLength (3*n + 1)

ans :: Int
ans = indexMax . map collatzLength $ [1..10^6]
    where
        indexMax xs              = indexMax' 1 xs 1 1
        indexMax' acc [] i j     = i
        indexMax' acc (x:xs) i j = indexMax' (if acc < x then x else acc) xs (if acc < x then j else i) (j+1)

main :: IO ()
main = print ans