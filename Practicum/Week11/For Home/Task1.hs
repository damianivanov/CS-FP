main :: IO()
main = do
    print $ isPresent 0 [0, -1, 2] == True
    print $ isPresent 1 [0, 1, 2] == True
    print $ isPresent 2 [0, 1, -2] == False
    print $ isPresent 3 [0, 1, 2] == False
    print $ isPresent 10 [0, 1, 2,3,4,10,10] == True
    print $ isPresent 10 [] == False

isPresent :: Int-> [Int] -> Bool    
isPresent _ [] = False
isPresent n (x:xs) = (x==n) || isPresent n xs