-- Copyright © 2020
--
-- Francisco Javier Blázquez Martínez ~ frblazqu@ucm.es
--
-- Double degree in Mathematics-Computer engineering.
-- Complutense university, Madrid.
--
-- Description:
-- Haskell implementation of a graph data type.

data Vertice = A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z deriving (Show,Read,Eq)
type Arista = (Vertice,Vertice)
data Grafo = Grafo [Vertice] [Arista] deriving (Show,Read,Eq)

-- Dummy function to proof the syntax
num_vertices::Grafo -> Int
num_vertices (Grafo vertices _) = length vertices

-- Checks the consistency of the graph given as parameter
es_grafo::Grafo -> Bool
es_grafo (Grafo vertices aristas) = (not (null vertices)) && (no_rep vertices []) && (no_rep aristas []) && (consistent_edges vertices aristas)
    where no_rep [] _ = True
          no_rep (x:xs) l = (not (elem x l)) && (no_rep xs (x:l))
          consistent_edges _ [] = True
          consistent_edges v  (e:es) = (elem (fst e) v) && (elem (snd e) v) && (consistent_edges v es)

-- Returns the adjacent vertices to one given
adyacentes::Vertice -> [(Vertice,Vertice)] -> [Vertice]
adyacentes v aristas = [snd edge | edge<-aristas, (fst edge)==v] 

-- Returns the adjacent vertices considering the graph as undirected
-- adyacentes_no_dirigido::Vertice -> [(Vertice,Vertice)] -> [Vertice]
-- adyacentes_no_dirigido v aristas = [snd edge | edge<-aristas, ((fst edge)==v||(snd edge)==v)] 


-- Returns the adjacency matrix for a given graph 
mat_ady::Grafo -> [[Bool]]
mat_ady (Grafo vertices aristas) = [[(elem (v,k) aristas) | k<-vertices]| v<-vertices]

-- Se puede hacer más eficiente si la matriz es un parámetro que actualizamos
-- (Procesamos las aristas actualizando la lista)
-- mat_ady::Grafo -> [[Bool]] -> [[Bool]]
-- mat_ady (Grafo vertices []) m = m
-- mat_ady (Grafo vertices (x:xs)) m = ...


-- Returns the positive (in) grade of each vertix
grados_pos::Grafo -> [Int]
grados_pos (Grafo [] _) = []
grados_pos (Grafo (x:xs) aristas) = (length [a | a<-aristas, (snd a)==x]):(grados_pos (Grafo xs aristas))

-- Se puede hacer más eficiente si la lista es un parámetro que actualizamos
-- (Procesamos las aristas actualizando la lista)
-- grados_pos::::Grafo -> [Int] -> [Int]
-- grados_pos (Grafo vertices []) degs = degs
-- grados_pos (Grafo vertices (x:xs)) degs = ...



-- Returns the negative (out) grade of each vertix
grados_neg::Grafo -> [Int]
grados_neg (Grafo [] _) = []
grados_neg (Grafo (x:xs) aristas) = (length [a | a<-aristas, (fst a)==x]):(grados_neg (Grafo xs aristas))

-- Se puede hacer más eficiente si la lista es un parámetro que actualizamos
-- (Procesamos las aristas actualizando la lista)
-- grados_neg::::Grafo -> [Int] -> [Int]
-- grados_neg (Grafo vertices []) degs = degs
-- grados_neg (Grafo vertices (x:xs)) degs = ...



-- Returns all the possible paths from vertix v with length n
camino_lng:: Grafo -> Vertice -> Int -> [[Vertice]]
camino_lng (Grafo vertices aristas) v 0 = [[v]]
camino_lng (Grafo vertices aristas) v k = [v:l | l<-(concat [(camino_lng (Grafo vertices aristas) ady (k-1)) | ady<-(adyacentes v aristas)])]



-- Returns all connected vertices to one given considering the graph is not directed
conectados_no_dirigido::Vertice -> [Arista] -> [Vertice]
conectados_no_dirigido v edges = cndaux [v] [] edges 
    where cndaux [] l _ = l
          cndaux (x:xs) l edges = if (elem x l) then cndaux xs l edges
                                 else cndaux (xs++[snd a|a<-edges,(fst a)==x]++[fst a|a<-edges,(snd a)==x]) (x:l) [e|e<-edges,(fst e)/=x,(snd e)/=x]

-- Retruns whether a graph is weakly connected or not
conexo_debil::Grafo -> Bool
conexo_debil (Grafo vertices aristas) = ((length vertices)==(length (conectados_no_dirigido (head vertices) aristas)))

-- Returns whether a graph is weakly connected or not
-- conexo_debil::Grafo -> Bool
-- conexo_debil (Grafo vertices aristas)  = (incluidos vertices (conectados_no_dirigido [(head vertices)] [] aristas))
--     where conectados_no_dirigido [] l _ = l
--           conectados_no_dirigido (x:xs) l edges = if (elem x l) then conectados_no_dirigido xs l edges
--                                                   else []
--           incluidos _ _ = True



-- Returns all connected vertices to one given considering the graph is directed
conectados_dirigido::Vertice -> [Arista] -> [Vertice]
conectados_dirigido v edges = cdaux [v] [] edges 
    where cdaux [] l _ = l
          cdaux (x:xs) l edges = if (elem x l) then cdaux xs l edges
                                 else cdaux (xs++[snd a|a<-edges,(fst a)==x]) (x:l) [e|e<-edges,(fst e)/=x]

-- Retruns whether a graph is strongly connected or not
conexo_fuerte::Grafo -> Bool
conexo_fuerte (Grafo vertices aristas) = (all (\x -> (length vertices)==(length (conectados_dirigido x aristas))) vertices)

-- conexo_debil (Grafo (x:xs) aristas) = (set_equal (alcanzables_no_dirigido x aristas []) (x:xs)) 
--    where set_equal [] [] = True
--          set_equal [] (y:ys) = False
--          set_equal (x:xs) l  = 
--          alcanzables_no_dirigido x aristas l = if (elem x l) then []
--                                                else          then x:(concat [(alcanzables_no_dirigido y aristas (x:l)) | y<-(adyacentes_no_dirigido x)])


-- Returns wheter two graphs are isomorphous or not
isomorfos::Grafo -> Grafo -> Bool
isomorfos (Grafo v1 a1) (Grafo v2 a2) = (elem (mat_ady (Grafo v1 a1)) [mat_ady (Grafo v a2) | v<-(all_permutations v2)])
    where all_permutations [] = [[]]
          all_permutations l  = [a:x | a <- l, x <- (all_permutations $ filter (\x -> x /= a) l)]


