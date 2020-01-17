-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Basic haskell concepts and a brief introduction to functional
-- programming with haskell.


-- 1.- Basics:
--
-- Haskell is not an imperative programming language so we do not
-- explicitly specify the data operations and modifications we want
-- to execute. What we do is defining some expresions that can be
-- evaluated. This idea of evaluating certain expressions is Haskell's
-- main idea.


-- 2.- Predefined functions:
--
-- +,-,*,/,div,mod,^,^^,**,...
-- even, odd, lcm, gcd
-- abs, signum, negate, min, max
-- exp, sqrt, log, **, logBase, sin, tan, cos, asin, atan, acos, ...
-- truncate, round, ceiling, floor, fromInteger, toInteger, fromIntegral
-- fst, snd, head, tail
--
-- Aclaration: div 3 1 ~ 3 `div` 1


-- 3.- Lists and tuples:
--
-- The tuples let us defining a new type that consists on a concrete 
-- number of arguments of a concrete type.
--
-- Example: (1, True)
--
-- Lists however exist for having an undefined number of arguments or
-- elements of a concrete given type. Haskell supports infinite lists.
--
-- Example: [1,2,3,4,5,6]


-- 4.- Types:
--
-- Using ':t' before any piece of data or any expression will return
-- the type of this expression. (However this is a command for the 
-- haskell interpreter, not a haskell function).
--
-- Example: :t True = True::Bool   
--          :t (&&) = (&&)::Bool -> Bool -> Bool
--
-- Tipos polimórficos y monomórficos, polimórficos cualificados y 
-- paramétricos.
--
-- Example: :t (+)  = (+)::Num a => a -> a -> a
--          :t (==) = (==)::Eq a => a -> a -> Bool
--          :t (<=) = (<=)::Ord a => a -> a -> Bool
--
-- Haskell uses static type inference, so the type of a variable or 
-- an expresion is determined before the evaluation.
--
-- Data classes: Eq, Ord, Show, Read, Num, Integral, Fractional

-- maximal::(Ord a) => a -> a -> a
-- maximal a b = if(a > b) then a
--               else           b

-- 5.- List's functions:
-- 
-- head, last, init, null, tail, length, ++, reverse, concat, elem,
-- !!, take, drop, splitAt, sum, product, and, or, zip, unzip.
--
-- Other functions:
-- [1..4]   ~ enumFromTo 1 4       ~ [1,2,3,4]
-- [1,3..7] ~ enumFromThenTo 1 3 7 ~ [1,3,5,7]
-- [1..]    ~ enumFrom 1           ~ [1,2,3,4...]
-- [1,3..]  ~ enumFromThen 1 3     ~ [1,3,5,7,9..]
--
-- Other way to define lists:
-- [1,2,3,4] ~ 1:2:3:4:[]
--
-- To apply a function over all the elements of a list we use map:
--
-- map (^2)  [1,2,3] = [1,4,9]
-- map (:[]) [1,2,3] = [[1],[2],[3]]
--
-- Other high order function for lists are filter, all, any,
-- takeWhile, dropWhile, span, break. More about high order functions
-- can be seen at section 10.

-- 6.- Syntactical expressions:
-- 
-- if b then e else e'          (:t if _ then _ else _ ??)
--
-- Example: if 2+2==4 then [1,2] else [1]
--
-- let x=e int e'
-- 
-- Example: let x=length[1..100] in x+x
--
-- case e of 
-- t1 -> e1
-- t2 -> e2
-- ..
-- tn -> en

        
-- 7.- Function definition in Haskell:
--
-- A program in haskell (some *.hs file) consist on several function 
-- definitions, some type, classes or instances definitions...
-- The functions are defined via equations. How to properly define
-- functions in haskell is easier to be learnt with examples.
-- 
-- Ver definiciones con ajuste de patrones y con guardas.
--
-- function(x0, .. , xn) = e1
-- function(y0, .. , yn) = e2
-- ...
-- function(x, ...., z)  = en
--
-- function t1, ... tn
--  | b1 = e1
--    ...
--  | bm = em
--  | otherwise = em+1


-- 8.- Expressions evaluation:
--
-- f e1 e2 e3 ... en
-- 
-- In order of evaluating this, it first looks for a definition
-- with a pattern that matches the expression.
-- It goes then to the first guard that evaluates to true and it
-- evaluates the expression of the guard after doing de adjustment
-- of the pattern.
--
-- Funciones estrictas:
-- [[e]]=undefined => [[fe]]=undefined
--
-- infixr, infixl, infix??


-- 9.- Patterns:
--
-- These are made of variable identifiers, anonimous variables,
-- constructors, several concrete patterns...
--
-- Example:
-- soluciones’ (a,b,c) =
--      let d = b^2-4*a*c
--          e = -b/2*a
--          r = sqrt d/2*a
--      in  if d>0 then [e+r,e-r] else
--          if d==0 then [e]
--          else []

-- Example:
-- soluciones (a,b,c)
--      | d>0 = [e+r,e-r]
--      | d==0 = [e]
--      | d<0 = []
--      where   d = b^2-4*a*c
--              e = -b/2*a
--              r = sqrt d/2*a


-- 10.- High order functions:
--
-- This functions have some arguments or the result of a functional
-- type. We have seen map function for aplying some function to all
-- the elements in a list. This is an example of High order function.
--
-- High order functions over lists:
-- :t map    ---> map::(a->b)->[a]->[b]
-- :t filter ---> filter :: (a -> Bool) -> [a] -> [a]
-- :t all    ---> all :: Foldable t => (a -> Bool) -> t a -> Bool
-- :t any    ---> any :: Foldable t => (a -> Bool) -> t a -> Bool
-- :t iterate---> iterate :: (a -> a) -> a -> [a]
-- :t zipWith---> zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-- :t zip    ---> zip :: [a] -> [b] -> [(a, b)]
--
-- Ohter high order functions:
-- (.) for composition of functions   (.)::(b->c)->(a->b)->(a->c)
-- ($) for aplying a function to elem ($)::(a->b)-> a -> b
-- 
-- Foldr and Foldl functions:
-- These functions define an abstract schema for creating functions
-- to process all the elements in a list.
--
-- foldr f e [x1,...,xn] = f x1 (f x2 (...(f xn e)))
-- foldl f e [x1,...,xn] = (f (...(f (f e x1) x2)...)) xn
-- 
-- foldr can process infinite lists
-- foldl has to go all the list through


-- 11.- Lambda-expressions:
--
-- These are nothing else than anonymous functions. Applied to an
-- expression e' the result is the one obtained with the evaluation
-- of e when x takes the value of e'.
-- 
-- Examples:
-- (\x->x+1)2 = 3
-- (\x->x+1)((\x->2*x) 3) = 7
-- \(x,y) -> x) (3,4) = 3


-- 12.- Intensional lists:
--
-- [e | c1,...,cr, b1,...,bs]
--
-- Examples:
-- [x+1 | x <- [1..10] , primo x] = [3,4,6,8]
-- let u=3 in [u+x | x <- [1..u]] = [4,5,6]
--
-- Quicksort with haskell:
-- qsort :: Ord a => [a] -> [a]
-- qsort [] = []
-- qsort (x:xs) =  qsort [u | u <- xs, u < x]
--                 ++ [x] ++
--                 qsort [u | u <- xs, u > x]


