module Main where

{-
Power digit sum
Problem 16
215 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
-}

number :: Integer
number = 2^1000

digitSum :: (Integral a) => a -> a
digitSum 0 = 0
digitSum n = (mod n 10) + (digitSum (div n 10))

ans :: Integer
ans = digitSum number

main :: IO ()
main = print ans