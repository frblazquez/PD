-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Basic haskell examples, fibonacci function.


-- Non linear fibonacci function:
fibonacci_noLinear:: Integer -> Integer

fibonacci_noLinear 0 = 1
fibonacci_noLinear 1 = 1
fibonacci_noLinear n = fibonacci_noLinear (n-1) + fibonacci_noLinear (n-2)

-- Linear fibonacci function:
fibonacci_linear:: Integer -> Integer

fibonacci_linear 0 = 0
fibonacci_linear n = snd (fibonacci_aux n (0,1))
    where fibonacci_aux 1 p = p
          fibonacci_aux k p = fibonacci_aux (k-1) (snd p, fst p + snd p)

-- Other linear fibonacci function:
fibonacci_linear2:: Integer -> Integer

fibonacci_linear2 n = head(fibonacci_aux n)
    where fibonacci_aux 0 = [1]
          fibonacci_aux 1 = [1,1]
          fibonacci_aux p = ((fib1+fib2):fib1:fib2:lstfib)
            where (fib1:fib2:lstfib)=fibonacci_aux (p-1)

-- Other linear fibonacci function:
fibonacci_linear3:: Integer -> Integer

fibonacci_linear3 n = fst(fibonacci_aux n)
    where fibonacci_aux 0 = (1,1)
          fibonacci_aux 1 = (1,1)
          fibonacci_aux p = let x=fibonacci_aux (p-1) 
                            in  (fst x + snd x, fst x)

-- This also works but be very careful with using twice an identifier
--
--fibonacci_linear3 n = fst(fibonacci_aux n)
--    where fibonacci_aux 0 = (1,1)
--          fibonacci_aux 1 = (1,1)
--          fibonacci_aux n = let x=fibonacci_aux (n-1) 
--                            in  (fst x + snd x, fst x)

