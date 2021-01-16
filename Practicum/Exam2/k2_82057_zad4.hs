main :: IO()
main = do
    print $ isBinarySearchTree t1 -- > True
    print $ isBinarySearchTree t2 -- > False (в дясното поддърво има стойности, помалки от тази в корена)
    print $ isBinarySearchTree t3 -- > False (лявото поддърво не е двоично дърво затърсене)

data BTree = Empty | Node Int BTree BTree
t1 :: BTree                               --  8
t1 = Node 8 (Node 3 (Node 1 Empty Empty) -- /   \
                  (Node 4 Empty Empty)) -- 3     10
         (Node 10 (Node 9 Empty Empty) -- / \   /  \
                (Node 14 Empty Empty)) -- 1  4 9   14

t2 :: BTree                               -- 8
t2 = Node 8 (Node 3 (Node 1 Empty Empty) -- / \
                   (Node 4 Empty Empty)) -- 3 10
          (Node 10 (Node 5 Empty Empty) -- / \ /\
                 (Node 14 Empty Empty)) -- 1 4 5 14

t3 :: BTree                               -- 8
t3 = Node 8 (Node 3 (Node 5 Empty Empty) -- / \
                   (Node 6 Empty Empty)) -- 3  10
           (Node 10 (Node 9 Empty Empty) -- / \ / \
                  (Node 14 Empty Empty)) -- 5 6 9 14


isBTree :: BTree -> Int-> Bool
isBTree (Node _ Empty Empty) _  = True
isBTree Empty _ = True
isBTree (Node value left@(Node lv leftL rightL) right@(Node rv leftR rightR)) root
    | value < lv || value>rv = False 
    |otherwise = isBinarySearchTree(left) && isBinarySearchTree(right)


isBinarySearchTree :: BTree -> Bool
isBinarySearchTree (Node _ Empty Empty) = True
isBinarySearchTree Empty = False
isBinarySearchTree (Node value left right) = isBTree left value && isBTree right value
            