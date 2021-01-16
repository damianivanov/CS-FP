main :: IO()
main = do  
    print $ primesInRange 1 100 == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]
    print $ primesInRange 100 1 == [2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97]


isPrime :: Int -> Bool
isPrime n = not (n<2) && all (\ i -> mod n i /= 0) [2 .. n-1] -- n - 1 e dosta po-bavno

primesInRange :: Int -> Int -> [Int]
primesInRange x y = [x | x <- [min x y .. max x y],isPrime x]
