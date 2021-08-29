module Main where

{-
Largest palindrome product
Problem 4
A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
-}


isPalindrome :: Int -> Bool
isPalindrome n = n == (reverseDigits n)
    where 
        reverseDigits :: Int -> Int
        reverseDigits n = foldl1 (\acc x -> acc*10 + x) (splitDigits n)
        splitDigits :: Int -> [Int]
        splitDigits 0 = []
        splitDigits n = mod n 10 : (splitDigits $ div n 10)


ans :: Int
ans = maximum [n*m | n <- [999,998..100], m <- [999,998..100], isPalindrome(n*m)]


main :: IO ()
main = do
    print ans