main :: IO()
main = do
    print $ myMin 5 6
    print $ myMin 6 5 == 5
    print $ myMinGuards 6 5 == 5

myMin :: Int -> Int -> Int  
myMin x y = if x < y then x else y

myMinGuards :: Int -> Int -> Int
myMinGuards x y
    | x < y = x
    | otherwise = y