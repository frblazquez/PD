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


-- Para mostrar un grafo cualquiera
-- showGrafo::Grafo -> String
-- showGrafo (Grafo vertices aristas) = show [[1,2,3],[4,5,6],[7,8,9]]


-- Para poder leer un grafo
-- readGrafo::Read a => Int -> ReadS a
-- readGrafo _ input = [((Grafo [] []),"")]


leerVertices::IO [Vertice]
leerVertices = do c <- getChar
                  if c=='\n' then return []
                  else if c==',' || c=='[' || c==']' || c==')' || c=='(' then leerVertices
                  else do vaux <- leerVertices            
                          return ((read (c:[]) ::Vertice):vaux)

leerVertice::IO Vertice
leerVertice = do c <- getChar
                 if c=='\n' then error "end of line reached, parsing failed"
                 else if c==',' || c=='[' || c==']' || c==')' || c=='(' then leerVertice
                 else return (read (c:[]) ::Vertice)

leerArista::IO Arista
leerArista = do v1 <- leerVertice 
                v2 <- leerVertice
                return (v1,v2)

leerAristas::IO [Arista]
leerAristas = do c <- getChar
                 if c=='\n' then return []
                 else if c==',' || c=='[' || c==']' || c==')' || c=='(' then leerAristas
                 else do v2 <- leerVertice
                         eaux <- leerAristas           
                         return (((read (c:[]) ::Vertice),v2):eaux)

leerGrafo::IO Grafo
leerGrafo = do print "Por favor, introduzca la lista de vertices:"
               v <- leerVertices
               print "Por favor, introduzca la lista de aristas:"
               a <- leerAristas
               return (Grafo v a)
               if (es_grafo (Grafo v a)) then return (Grafo v a)
                                         else do print "ERROR! El grafo introducido no es correcto"
                                                 leerGrafo


muestra_matriz::IO()
muestra_matriz  = do g <- leerGrafo
                     listaDobleAMatriz (mat_ady g)

listaDobleAMatriz::[[Bool]] -> IO()
listaDobleAMatriz [] = putChar ' '
listaDobleAMatriz (x:xs) = do booleanosA1y0s x
                              listaDobleAMatriz xs

booleanosA1y0s::[Bool] -> IO()
booleanosA1y0s [] = putChar '\n'
booleanosA1y0s (x:xs) = do if x then putStr "1 "
                                else putStr "0 "
                           booleanosA1y0s xs
                                     

-- muestra_lista_bool:: [[Bool]] -> IO()
-- muestra_lista_bool = print "Hola"




-- // NO ES NECESARIO GRACIAS A 'DERIVING'
-- instance Show Vertice where show = showVertice

--showVertice::Vertice -> String
--showVertice A = "A"
--showVertice B = "B"
--showVertice C = "C"
--showVertice D = "D"
--showVertice E = "E"
--showVertice F = "F"
--showVertice G = "G"
--showVertice H = "H"
--showVertice I = "I"
--showVertice J = "J"
--showVertice K = "K"
--showVertice L = "L"
--showVertice M = "M"
--showVertice N = "N"
--showVertice O = "O"
--showVertice P = "P"
--showVertice Q = "Q"
--showVertice R = "R"
--showVertice S = "S"
--showVertice T = "T"
--showVertice U = "U"
--showVertice V = "V"
--showVertice W = "W"
--showVertice X = "X"
--showVertice Y = "Y"
--showVertice Z = "Z"



g1 = (Grafo [B,D,E,C] [(D,E),(E,B),(C,B),(E,C)])
g2 = (Grafo [D,F,E]   [(D,F),(E,D),(D,E),(F,E)])
g3 = (Grafo [A,C,D]   [(A,C),(C,D),(A,D)])
g4 = (Grafo [A,B,C,D,E,F,G] [(A,B),(A,C),(B,D),(B,E),(C,F),(C,G)])
g5 = (Grafo [A,B,C,D] [(A,B),(B,C),(C,D),(D,A)])
g6 = (Grafo [B,C,D,E] [(B,C),(C,D),(D,E),(E,B)])
g7 = (Grafo [B,C,D,E] [(D,E),(E,B),(B,C),(C,D)])
g8 = (Grafo [D,E,B,C] [(D,E),(E,B),(B,C),(C,D)])

-- data Palo  = Oros|Espadas|Copas|Bastos
-- data Valor = Uno|Dos|Tres|Cuatro 
-- data Carta = Carta Valor Palo

-- muestra_carta::Carta->String
-- muestra_carta (Carta Uno _) = "Tienes un as"
-- muestra_carta _             = "No tienes un as"

