main :: IO()
main = do
    print $ myGcd 5 13 == 1
    print $ myGcd 13 1235 == 13
    print $ myGcd 28 12 == 4
    print $ myGcd 12 28 == 4

myGcd :: Int -> Int -> Int
myGcd x y 
    | x == 0 = y
    | y == 0 = x
    | x < 0 || y < 0 = gcd (abs x) (abs y)
    | otherwise = gcd y (x `mod` y)
