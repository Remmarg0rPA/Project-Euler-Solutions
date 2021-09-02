module Main where

{-
Number letter counts
Problem 17
If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
-}


main :: IO ()
main = print ans

ans = sum . map (length . numToStr) $ [1..1000]

numToStr n = if n < 10 
                then getOnes n 
             else if n < 100
                 then getTens n
            else if n < 1000
                then getHundreds n
            else getTousands n
            where
                getOnes n     = if n == 0 then "" else ones!!n
                getTens n     = if n < 10
                                    then getOnes n
                                else if n == 10
                                    then tens!!0
                                else if n < 20
                                    then tenToTwenty!!(n-10)
                                else (tens!!(n `div` 10 - 1) ++ getOnes(n `mod` 10))
                getHundreds n = getOnes (div n 100) ++ "hundred" ++ 
                                (if (mod n 100) /= 0 
                                    then "and" ++ getTens (mod n 100) 
                                else "")
                getTousands n = getOnes (div n 1000) ++ "thousand" ++
                                (if (mod n 1000) /= 0 
                                    then getHundreds (mod n 100)
                                else "")

ones :: [String]
ones = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]

tenToTwenty :: [String]
tenToTwenty = ["ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

tens :: [String]
tens = ["ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"]