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



            
