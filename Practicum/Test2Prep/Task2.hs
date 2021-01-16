import Data.List
main :: IO()
main = do
     print $ removeDuplicates [1,1,1,2,2,3,2] 
     print $ sumUnique [[1,2,3,2],[-4,-4],[5]] -- → 9 (= 1+3+5)
     print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] -- → 0
     print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] -- → 45

removeDuplicates :: [Int] -> [Int]
removeDuplicates [] = []
removeDuplicates (x:xs) = removeDuplicates (removeAllOccurences xs x) 

removeAllOccurences :: [Int]->Int->[Int]
removeAllOccurences [] _ = []
removeAllOccurences (x:xs) k
     | x==k = removeAllOccurences xs k
     | otherwise = x:removeAllOccurences xs k


sumUnique :: [[Int]] -> Int
sumUnique xs = sum $ concat [] 