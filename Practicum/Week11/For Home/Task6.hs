main :: IO()
main = do
    print $ isImage [1, 2, 3, 4] [2, 3, 4, 5] == (True, 1)
    print $ isImage [1, 2, 3, 4] [4, 5, 6, 7] == (True, 3)
    print $ isImage [4, 5, 6, 7] [1, 2, 3, 4] == (True, -3)
    print $ isImage [1, 2, 3, 4] [4, 5, 6, 6] == (False, 0)
    print $ isImage [1, 2] [-1, -2] == (False, 0)
    print $ isImage [1, 2, 3, 4] [2, 3, 4, 4] == (False, 0)

isImageB :: [Int] -> [Int] -> Bool
isImageB xs ys = length xs == length ys
                && [ x + (head ys - head xs)| x <- xs] == ys

isImage ::[Int] -> [Int] -> (Bool,Int)
isImage [] [] = (False,0)
isImage xs ys = if isImageB xs  ys then (True,head xs-head ys) else (False,0)