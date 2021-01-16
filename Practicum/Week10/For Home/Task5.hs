main :: IO()
main = do   
    print $ sumUnique [[1,2,3,2],[-4,-4],[5]] == 9 -- (= 1 + 3 + 5)
    print $ sumUnique [[2,2,2],[3,3,3],[4,4,4]] == 0
    print $ sumUnique [[1,2,3],[4,5,6],[7,8,9]] == 45

count :: [Int]-> Int -> Int
count xs x = length $ filter (== x) xs

sumUnique :: [[Int]] -> Int
sumUnique xxs = sum $ filter (\ i ->  count (concat xxs) i == 1) $ concat xxs