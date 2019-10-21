-- Francisco Javier Blázquez Martínez - frblazqu@ucm.es 
-- 
-- Descripción: Iniciación a haskell.

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
--
