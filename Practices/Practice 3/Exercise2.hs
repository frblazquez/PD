-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Implement the following functions using higher order functions and intensional lists.


-- a) suffix xs = list with all the suffix of xs

suffixes:: [a] -> [[a]]
suffixes [] = []
suffixes (x:xs) = [(x:xs)] ++ suffixes xs

suffixes2::[a] -> [[a]]
suffixes2 []     = []
suffixes2 (x:xs) = (x:xs):(suffixes xs)


-- b) sublists xs = list with all the sublists of xs

----- Sublists in a recursive way:
sublists:: [a] -> [[a]]
sublists [] = []
sublists xs = (suffixes xs) ++ (sublists (init xs))

----- Sublists with intensional lists:
sublists2:: [a] -> [[a]]
sublists2 xs = [take_fromi_toj i j xs | i <- [0..(length xs)], j <- [(i+1)..(length xs)]]

take_fromi_toj:: Int -> Int -> [b] -> [b]
take_fromi_toj i j xs = drop i (take j xs)


-- c) perms xs = list with all the permutations of xs

my_concat:: [a] -> [[a]] -> [[a]]
my_concat [] ys = ys
my_concat xs [] = [xs]
my_concat xs (y:ys) = [xs ++ y] ++ (my_concat xs ys)

permutations:: [a] -> [[a]]
permutations [] = []
permutations xs = [(my_concat [(xs !! i)] (permutations ((take i xs) ++ (drop (i+1) xs))))| i <- [0..((length xs) - 1)]]


-- d) addends k = list with all the descompositions of k in positive addends:

-- addends::(Integral a) => a -> [a]
-- addends k = [(_:x:y:xs)| x <- [1..k], y <- [x..k] ] 







