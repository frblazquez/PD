-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Define using high order functions or intensional lists the following:


-- a) [1,-1,2,-2,3,-3,4,-4...]

----- Result with a recursive definition:
list_z::(Integral a) => [a]
list_z  = list_z_aux 1 0
    where list_z_aux k i = (if(i==0) then k:(list_z_aux k 1) else (-k):(list_z_aux (k+1) 0)) 


----- Result with higher order functions (foldr):
list_z2::(Integral a) => [a]
list_z2 = foldr (\x y -> x:(-x):y) [] [1..]


-- b) A list to enumerate all pair of natural numbers (Cantor diagonalization):

----- Result with a recursive definition:
pair_naturals::(Integral a) => [(a,a)]
pair_naturals = pair_naturals_aux 0 0
    where pair_naturals_aux p q 
            | p==0      = (p,q):(pair_naturals_aux (q+1) 0)
            | otherwise = (p,q):(pair_naturals_aux (p-1) (q+1))

----- Result with higer order functions (foldr):




