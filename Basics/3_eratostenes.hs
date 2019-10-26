-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Haskell basics, implementation of the eratosthenes sieve.

eratostenes::[Integer]

eratostenes = eratostenesAux [] [2..]

eratostenesAux list1 list2 = eratostenesAux (list1 ++ [b]) list3
        where b     = head(list2)
              list3 = [i | i <- list2, i`mod`b==0]

