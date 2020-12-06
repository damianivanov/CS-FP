main :: IO()
main = do
    print $ myReverse 12345 == 54321
    print $ myReverse 1 == 1
    print $ myReverse 21 == 12
    print $ myReverse 123456789 == 987654321
    
myReverse :: Int -> Int 
myReverse x = if x < 0 then error "x has to be positive" else helper x 0
    where
        helper leftOver res
            | leftOver < 10 = res*10 + leftOver
            | otherwise = helper (div leftOver 10) ((res * 10) + (leftOver `mod` 10))