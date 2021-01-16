main :: IO()
main = do
    print $ removeFirst 5 [5, 1, 5, 3, 5] == [1, 5, 3, 5]
    print $ removeFirst 3 [5, 1, 5, 3, 5] == [5, 1, 5, 5]

removeFirst :: Int -> [Int] -> [Int]
removeFirst _ [] = []
removeFirst n xs = helper xs []
    where  
        helper :: [Int] -> [Int] -> [Int]
        helper [] leftside = leftside
        helper (y:ys) leftside 
            | y == n = leftside ++ ys 
            | otherwise = helper ys (y : leftside)