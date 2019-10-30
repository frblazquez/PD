-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Analysis of the cpu time for some common functions.


-- last [1..10^5]    --> everything ok
-- last [1..10^7]    --> still good
-- last [1..10^10]   --> not able to finish
-- length [1..10^20] --> not able to finish
-- last (drop 100 ([1..10^20] ++ [1..100]))
-- last (drop 1 ([1..10^20] ++ [1..100]))
--
-- last function requires to go through all the list.

-- head [1..10^5]
-- head [1..10^15]
-- head [1..]
-- head (tail [1..10^20])
-- head (drop (10^7) ([1..10^20] ++ [1..100]))
--
-- lazy evaluation, head only takes the first element.

-- last (take (10^7) [1..10^20])
-- head (take (10^7) ([1..100] ++ [1..10^20]))
-- last (take 100 ([1..10^20] ++ [1..100]))
--
-- The usage of take also allow us to avoid big 'last' executions.

-- [1..10^7] ==[1..10^7]    --> It can process this
-- [1..10^20]==[1..10^20]   --> Not able to finish
-- [1..10^20]==[1..10^20+1] --> Not comparing from right to left
-- [1..10^20]==[2..10^20]   --> Comparing from left to right

-- head (reverse [1..10^7])                    ~ last [1..10^7] ?
-- last (reverse [1..10^7])                    ~ head [1..10^7] ?
-- reverse [1..10^20] == reverse [1..10^20+1]  ~ compare the last ?
--
-- Haskell is not able to see these equivalences. It does the operations.
