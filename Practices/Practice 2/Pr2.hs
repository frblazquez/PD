-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Descripción:
-- Sesión de laboratorio 21/10/19




-- 5. Programa las funciones del ejercicio 1 utilizando funciones de orden superior:

-- a) La lista de los cuadrados de los números naturales entre 0 y n:

cuadrados 0 = []
cuadrados n = map  (^2) [1..n]

-- b) La lista anterior pero con cada número emparejado con su cuadrado y en orden inverso:

num_y_cuadrado 0 = []
num_y_cuadrado n = reverse (zip [1..n] (cuadrados n))

-- c) suma de uno a cien de i por el valor absoluto del seno de i:

sum_iseni = sum [ i*abs(sin(i)) | i <- [1..100] ]

-- e) La suma de los números menores que 1000 que sean múltiplos de 3 o 5:

sum_3k_5k_hasta1000 = sum [i | i <- [1..1000], i`mod`3==0, i`mod`5==0]

-- d) El número de potencias de 3 que sean menores que n y acaben en 67:

num_3expk_terminan67 n = length [i | i <- [1..n], (i-67)`mod`100==0, potencia3 i]


