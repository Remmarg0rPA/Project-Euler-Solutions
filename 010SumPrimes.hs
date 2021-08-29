module Main where

{-
Summation of primes
Problem 10
The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

Find the sum of all the primes below two million.
-}

limit :: Int
limit = 2 * 10^6

squareRoot :: Integral t => t -> t
squareRoot n = bbin 0 (n+1)
    where bbin a b | a + 1 == b = a
                   | otherwise = if m*m > n
                                 then bbin a m
                                 else bbin m b
                               where m = (a + b) `div` 2

numberOfDivisors :: (Integral a ) => a -> a
numberOfDivisors n = sum [1 | x<-[1..(squareRoot n)], mod n x == 0] + 1

isPrime :: (Integral a) => a -> Bool
isPrime n = numberOfDivisors n == 2 

ans :: Int
ans = sum [p | p<-[3,5..limit], isPrime p] + 2

main :: IO()
main = print ans