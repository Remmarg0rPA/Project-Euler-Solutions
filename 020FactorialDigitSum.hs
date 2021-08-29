module Main where

{-
Factorial digit sum
Problem 20
n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!
-}

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

digitSum :: Integer -> Integer
digitSum 0 = 0
digitSum n = (mod n 10) + (digitSum (div n 10))

ans = digitSum . factorial $ 100

main :: IO ()
main = print ans