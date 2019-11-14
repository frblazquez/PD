-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Higher order functions custom implementation with fold function:

module Practice_2_3 where
import Prelude hiding (last,reverse,all,minimum,map,filter,takeWhile,(++))

-- a) last:

last:: [a] -> a
last xs = foldl (\_ y -> y) undefined xs 

-- b) reverse:

reverse::[a] -> [a]
reverse xs = foldr (\x y -> y ++ [x]) [] xs

-- c) all:

all::(a -> Bool) -> [a] -> Bool
all p xs = foldr (\x y -> (p x) && y) True xs

-- d) minimum:

minimum::(Ord a) => [a] -> a
minimum xs = foldr (\x y -> min x y) (head xs) xs

-- e) map:

map::(a -> b) -> [a] -> [b]
map f xs = foldr (\x y -> (f x):y) [] xs

-- f) filter:

filter::(a -> Bool) -> [a] -> [a]
filter p xs = foldr (\x y -> ((if p x then [x] else [])++y)) [] xs 


-- g) takeWhile:

takeWhile::(a -> Bool) -> [a] -> [a]
takeWhile p xs = foldr(\x y -> (if p x then [x]++y else [])) [] xs


-- h) (++) 

(++)::[a] -> [a] -> [a]
(++) xs ys = foldr (\x y -> x:y) ys xs
