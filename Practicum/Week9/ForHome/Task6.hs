main :: IO()
main = do  

    print $ hasIncDigits 1244 == True
    print $ hasIncDigits 12443 == False
    
hasIncDigits :: Int -> Bool
hasIncDigits x 
    | x < 0 = error "x has to be positive" 
    | x < 10 = True
    | otherwise = ((x `mod` 10) >= ((x `quot` 10) `rem` 10) ) && hasIncDigits (x `quot` 10)