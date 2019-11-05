-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Define a function for computing the mean of a list of elements
-- using the 'length' function.

mean::(Num a, Enum a, Fractional b) => [a] -> b
mean (x:xs) = fromIntegral (length (acumulate [1..x] xs))/ fromIntegral(length (count [1] xs))
       

acumulate::(Num a, Enum a) => [a] -> [a] -> [a]
acumulate l []     = l
acumulate l (p:ps) = acumulate (l ++ [1..p]) ps


count::(Num a) => [a] -> [a] -> [a]
count l []         = l
count l (p:ps)     = count     (l ++ [1])    ps
