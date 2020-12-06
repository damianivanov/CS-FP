main :: IO()
main = do
    print $ areAmicable 200 300 == False
    print $ areAmicable 220 284 == True
    print $ areAmicable 284 220 == True
    print $ areAmicable 1184 1210 == True
    print $ areAmicable 2620 2924 == True
    print $ areAmicable 6232 6368 == True
   
sumOfDivisors :: Int -> Int
sumOfDivisors x = if x < 0 then error "x has to be positive" else helper 0 1
    where
        helper result currDiv
            | currDiv > x = result
            | x `mod` currDiv == 0 = helper (result + currDiv) (currDiv + 1)
            | otherwise = helper result (currDiv + 1)



areAmicable :: Int -> Int -> Bool
areAmicable x y = sumOfDivisors x == sumOfDivisors y