-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Define the function && with patterns adjustment method.

module Practice_1_5 where
import Prelude      hiding ((&&), and)

-- One easy definition:
(&&):: Bool -> Bool -> Bool
(&&) False y = False
(&&) x False = False
(&&) True y  = y

-- Definition as estrict function in first variable:
and:: Bool -> Bool -> Bool
and False y = False
and True  y = y

-- Definition as estrict function in second variable:
and2:: Bool -> Bool -> Bool
and2 x False = False
and2 x True  = x

-- Non strict function definition:
and3:: Bool -> Bool -> Bool
and3 False _ = False
and3 _ False = False
and3 _ _     = True

