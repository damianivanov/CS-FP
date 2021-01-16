import Data.List
main :: IO()
main = do
    print $ "mergeLinearRec"
    print $ mergeLinearRec [1, 2, 3] [2, 3, 4, 5, 6] == [1, 2, 3, 4, 5, 6]
    print $ mergeLinearRec [1, 2, 3] [2] == [1, 2, 3]
    print $ mergeLinearRec [1, 2, 3] [7, 8, 9] == [1, 2, 3, 7, 8, 9]
    print $ mergeLinearRec [2, 3, 4, 5, 6] [1, 2, 3] == [1,2,3,4,5,6]
    print $ mergeLinearRec [2] [1, 2, 3] == [1,2,3]
    print $ mergeLinearRec [7, 8, 9] [1, 2, 3] == [1,2,3,7,8,9]
    print $ mergeLinearRec [7, 9, 11] [8, 10, 12] == [7,8,9,10,11,12]
    ---
    print $ "mergeLinearRec null cases"
    print $ mergeLinearRec [] [] == []
    print $ mergeLinearRec [] [1,2] == [1,2]
    print $ mergeLinearRec [1,2] [] == [1,2]

    print $ "mergeXs"
    print $ mergeXs [1, 2, 3] [2, 3, 4, 5, 6] == [1, 2, 3, 4, 5, 6]
    print $ mergeXs [1, 2, 3] [2] == [1, 2, 3]
    print $ mergeXs [1, 2, 3] [7, 8, 9] == [1, 2, 3, 7, 8, 9]
    print $ mergeXs [2, 3, 4, 5, 6] [1, 2, 3] == [1,2,3,4,5,6]
    print $ mergeXs [2] [1, 2, 3] == [1,2,3]
    print $ mergeXs [7, 8, 9] [1, 2, 3] == [1,2,3,7,8,9]
    print $ mergeXs [7, 9, 11] [8, 10, 12] == [7,8,9,10,11,12]
    ---
    print $ "mergeXs null cases"
    print $ mergeXs [] [] == []
    print $ mergeXs [] [1,2] == [1,2]
    print $ mergeXs [1,2] [] == [1,2]
    print $ "mergeYs"
    print $ mergeYs [1, 2, 3] [2, 3, 4, 5, 6] == [1, 2, 3, 4, 5, 6]
    print $ mergeYs [1, 2, 3] [2] == [1, 2, 3]
    print $ mergeYs [1, 2, 3] [7, 8, 9] == [1, 2, 3, 7, 8, 9]
    print $ mergeYs [2, 3, 4, 5, 6] [1, 2, 3] == [1,2,3,4,5,6]
    print $ mergeYs [2] [1, 2, 3] == [1,2,3]
    print $ mergeYs [7, 8, 9] [1, 2, 3] == [1,2,3,7,8,9]
    print $ mergeYs [7, 9, 11] [8, 10, 12] == [7,8,9,10,11,12]
    ---
    print $ "mergeYs null cases"
    print $ mergeYs [] [] == []
    print $ mergeYs [] [1,2] == [1,2]
    print $ mergeYs [1,2] [] == [1,2]

mergeLinearRec :: [Int] -> [Int] -> [Int]
mergeLinearRec xs ys 
        | null xs = ys   
        | null ys = xs 
        | head xs == head ys = mergeLinearRec (tail xs) ys
        | head xs < head ys = head xs : mergeLinearRec (tail xs) ys
        | otherwise = head ys : mergeLinearRec xs (tail ys)


mergeXs :: [Int] -> [Int] -> [Int]
mergeXs xs ys = sort (nub (xs ++ ys))

mergeYs :: [Int] -> [Int] -> [Int]
mergeYs xs ys 
    | null xs = ys   
    | null ys = xs 
    | otherwise = [x | x <-  [min (head xs) (head ys)  ..  max (last xs) (last ys)], elem x xs || elem x ys]