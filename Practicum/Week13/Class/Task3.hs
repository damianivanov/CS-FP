main :: IO()
main = do
    print $ t
    print $ size t == 13
    print $ getLevel t 2
    --print $ sumEq t == 2 (nodes 8 and 12)

data NTree a = Nil | Node a [NTree a]
    deriving (Show)


t ::NTree Int
t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]

getLevel :: NTree a -> Int -> [a]
getLevel Nil _ = error "index bigger than levels"
getLevel (Node value xs) k 
    | k < 0 = error "index is negative"
    | k == 0 = [value]
    | otherwise = concatMap (\ x -> getLevel x (k-1)) xs

size :: (Num a) => NTree a -> Int
size Nil = 0 
size (Node _ xs) = 1 + (sum $ map size xs)



-- sumEq :: NTree a -> a
-- sumEq =
