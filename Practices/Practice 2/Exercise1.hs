-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Define recursive functions in haskell to compute the following expressions:


-- a) Square of the natural numbers between 1 and n:

squares_r::(Integral a) => a -> [a]
squares_r 0 = []
squares_r n = squares_r (n-1) ++ [n*n]

-- b) Number and square from n to 1 in that order:

num_and_square_r::(Integral a) => a -> [(a,a)]
num_and_square_r 0 = []
num_and_square_r n = [(n, n*n)] ++ num_and_square_r (n-1)

-- c) Sum from 1 to 100 of n*abs(sin(n))

sum_iseni_till_k::(RealFloat b, Integral a) => a -> b
sum_iseni_till_k 0 = 0
sum_iseni_till_k n = (fromIntegral n)*abs(sin((fromIntegral n))) + sum_iseni_till_k (n-1)

sum_iseni_r::(RealFloat b) => b
sum_iseni_r = sum_iseni_till_k 100

-- d) Number of powers of 3 lowers than n finishing in 67:

----- d.1: Checking the condition one by one:
power3::(Integral a) => a -> Bool   
power3 1 = True
power3 n = n`mod`3==0 && power3 (div n 3)

num_3expk_ends_67_r::(Integral a) => a -> a
num_3expk_ends_67_r 0 = 0
num_3expk_ends_67_r n = if((n-67)`mod`100==0 && power3 n) then 1+num_3expk_ends_67_r (n-1)
                        else num_3expk_ends_67_r (n-1)

----- d.2: Checking the condition only over the powers of three:
powers3::(Integral a) => a -> [a]
powers3 n = powers3_aux 1 n
    where powers3_aux k m
            |m<=0      = []
            |k>=m      = []
            |otherwise = [k] ++ powers3_aux (3*k) m


num_3expk_ends_67_r2::(Integral a) => a -> a
num_3expk_ends_67_r2 n = num_ends67 (powers3 n)
    where num_ends67 [] = 0
          num_ends67 (x:xs) = if (x-67)`mod`100==0 then 1+(num_ends67 xs)
                              else num_ends67 xs


-- e) Addition of numbers lower than 1000 multiples of 3 and 5:

sum_3k_5k_menores::(Integral a) => a -> a
sum_3k_5k_menores 0 = 0
sum_3k_5k_menores n 
   | n`mod`3==0 && n`mod`5==0 = sum_3k_5k_menores (n-1) + n
   | otherwise                = sum_3k_5k_menores (n-1)

sum_3k_5k_r::(Integral a) => a
sum_3k_5k_r = sum_3k_5k_menores 1000

