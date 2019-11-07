-- Copyright © 2019
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Program the following functions in haskell:

-- a) digits x = number of digits of x

num_digits::(Integral a) => a -> a
num_digits x 
    | x<0      = num_digits (-x)
    | x<10     = 1
    |otherwise = 1 + num_digits (x`div`10)


-- b) reduction x = result of adding the digits of x and repeat until reach one digit

reduction::(Integral a) => a -> a
reduction x
    |x<0       = reduction (-x)
    |x<10      = x
    |otherwise = reduction (sum (digits x))

digits::(Integral a) => a -> [a]
digits x 
    |x<0       = digits (-x)
    |x<10      = [x]
    |otherwise = digits (x`div`10) ++ [x`mod`10]


-- c) perm n = number of permutations of n elements

perm::(Integral a) => a -> a
perm n 
    |n<0        = error "Not possible to compute the number of permutations of a negative number of elements"
    |n==0       = 1
    |otherwise  = n*perm (n-1)

perm2::(Integral a) => a -> a
perm2 0 = 1
perm2 n = n*perm2 (n-1)

-- d) var n m = variations of n elements taking m at time

var::(Integral a) => a -> a -> a
var n m
    |n<0        = error "First parameter must be a positive integer"
    |n<m        = error "Not possible to compute the number of variations, first argument must be greater or equal to the second"
    |n==m       = 1
    |otherwise  = n*var (n-1) (m)

var2::(Integral a) => a -> a -> a
var2 n m = (perm n)`div`(perm (n-m))

-- Not working, don't know why that patter is forbidden
--
-- var2::(Integral a) => a -> a -> a
-- var2 m m = 1
-- var2 m n = m * var2 (m-1) n

-- e) comb n m = number of combinations of n elements taking m at time

comb::(Integral a) => a -> a -> a
comb n m 
    | n<0       = error "First parameter must be a positive integer"
    | n<m       = error "Not possible to compute the number of variations, first argument must be greater or equal to the second"
    | m==0      = 1    
    | n==m      = 1
    | otherwise = (comb (n-1) m) + (comb (n-1) (m-1))


comb2::(Integral a) => a -> a -> a
comb2 n m = (perm n)`div`((perm m)*(perm (n-m)))

