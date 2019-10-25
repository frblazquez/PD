-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Haskell basics, prime numbers.


-- A) ONLY WITH RECURSIVE DEFINITIONS:

-- Function for computing the dividers of a number

dividers_r:: Integer -> [Integer]

dividers_r n 
    | n < 1     = []
    | otherwise = dividers_minor (n-1) ++ [n]
        where dividers_minor q 
                |q==0       = []
                |n`mod`q==0 = dividers_minor (q-1) ++ [q]
                |otherwise  = dividers_minor (q-1)

--dividers_r n 
--    | n < 1     = []
--    | otherwise = dividers_minor n (n-1) ++ [n]
--        where dividers_minor p q = 
--                if(q == 0)          then []
--                else if(p`mod`q==0) then dividers_minor p (q-1) ++ [q]
--                else                     dividers_minor p (q-1)

-- Function for determining wheter a number is prime or not:
prime_r:: Integer -> Bool

prime_r n = (dividers_r n) == [1,n]
                   

-- B) WITH HIGHER ORDER FUNCTIONS:

-- Function for computing the dividers of a given number:
dividers:: Integer -> [Integer]

dividers n = [i | i <- [1..(div n 2)], n`mod`i==0] ++ [n]

-- Function for determining wheter a number is prime or not:
prime:: Integer -> Bool

prime n = (dividers n) == [1,n]

-- Function for computing all the prime numbers:
primes:: [Integer]

primes = [i | i <- [1..], prime i]

-- Function for computing the prime number 100:
prime100:: Integer

prime100 = primes !! 99

-- Compute the first prime number greater than a parameter given:
prime_greater_than:: Integer -> Integer

prime_greater_than n = greater_than primes
    where greater_than list
            | n < (head list) = head list
            | otherwise       = greater_than (tail list)

