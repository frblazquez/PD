-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Create using higher order functions the following functionalities:



-- a) pairs_p_q xs p q = (a,b) / p(a) && q(b) (p and q conditions):

pairs_p_q:: [a] -> (a -> Bool) -> (a -> Bool) -> [(a,a)]
pairs_p_q l p q = cartesian_product truep trueq
    where cartesian_product xs ys = [(x,y) | x <- xs, y <- ys]
          truep = filter p l
          trueq = filter q l

-- b) filters xs ps = elements in xs verifying all properties in ps:

filters:: [a] -> [(a -> Bool)] -> [a]
filters [] _      = []
filters xs []     = xs
filters xs (p:ps) = filters (filter p xs) ps  

-- c) mapn x [f1,...,fn] = [f1 x, ... , fn x]

mapn:: a -> [(a -> b)] -> [b]
mapn _ []     = []
mapn x (f:fs) = [f x] ++ mapn x fs  


-- d) equals f g m n = (f x == g x) f.a. m <= x <= n

equals::(Integral a,Eq b) => (a -> b) -> (a -> b) -> a -> a -> Bool
equals f g m n
    | m>n       = True
    | otherwise = let l = [i| i <- [m..n]] in (map f l) == (map g l)


-- e) how_many p xs = number of elements in xs verifying p:

how_many:: (a -> Bool) -> [a] -> Int
how_many p xs = length (filter p xs)


-- f) lower p m n = lower element between m and n (both included) verif. p:

lower::(Integral a) => (a -> Bool) -> a -> a -> a
lower p m n
    |m>n       = undefined
    |otherwise = head (filter p [m..n])


-- g) greater p m n = same than lower but backwards:
----- This algorithm execution time is much worse than the other one

greater::(Integral a) => (a -> Bool) -> a -> a -> a
greater p m n
    |m>n       = undefined
    |otherwise = last (filter p [m..n])


-- h) exists p m n = exists an element among m and n verifying p:

exists::(Integral a) => (a -> Bool) -> a -> a -> Bool
exists p m n
    |m>n       = False
    |otherwise = [] /= (filter p [m..n])


