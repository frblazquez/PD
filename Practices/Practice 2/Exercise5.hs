-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Define functions in haskell to compute the following expressions:


-- a) Square of the natural numbers between 1 and n:

squares::(Integral a) => a -> [a]
squares n = [i*i| i <- [1..n]]

-- b) Number and square from n to 1 in that order:

num_and_square::(Integral a) => a -> [(a,a)]
num_and_square n = [(i,i*i) | i <-reverse [1..n]]

-- c) Sum from 1 to 100 of n*abs(sin(n))

sum_iseni_till100::(RealFloat b) => b
sum_iseni_till100 = sum [(fromIntegral i)*abs(sin((fromIntegral i)))| i <-[1..100]]

-- d) Number of powers of 3 lowers than n finishing in 67:

powers3::(Integral a) => a -> [a]
powers3 n = powers3_aux 1 n
    where powers3_aux k m
            |m<=0      = []
            |k>=m      = []
            |otherwise = [k] ++ powers3_aux (3*k) m

num_3expk_ends_67::(Integral a) => a -> a
num_3expk_ends_67 n = my_length [i| i <- powers3 n, (i-67)`mod`100==0]
    where my_length [] = 0
          my_length (x:xs) = 1 + my_length xs

-- Length function not working in this case, why?
--
-- num_3expk_ends_67::(Integral a) => a -> a
-- num_3expk_ends_67 n = length [i| i <- powers3 n, (i-67)`mod`100==0]

-- e) Addition of numbers lower than 1000 multiples of 3 and 5:

sum_3k_5k::(Integral a) => a
sum_3k_5k = sum [i | i <- [1..1000], i`mod`3==0, i`mod`5==0]

