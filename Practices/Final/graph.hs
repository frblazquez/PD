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



