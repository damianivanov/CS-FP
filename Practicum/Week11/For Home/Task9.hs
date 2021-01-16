main ::IO()
main = do
    print $ naturalProduct [-1, 0, -2, -3] 5 == 0 -- There are no natural numbers
    print $ naturalProduct [5, 10] 5 == 0 -- Sum of the divisors is 9
    print $ naturalProduct [95, 75, 15, 55, 11, 14, 18, 35, 25] 5 == 1330

sumOfDivisors :: Int -> Int
sumOfDivisors n = sum [x | x <- [1..n-1],rem n x ==0]

naturalProduct :: [Int] -> Int -> Int
naturalProduct xs k = if x == 1 then 0 else x 
    where 
        x = product [x | x <- xs, x > 0 && mod (sumOfDivisors x) k == 0]

        --instead of if (product [x | x <- xs, x>0 && rem (sumOfDivisors x) k == 0]) == 1 then 0 else (product [x | x <- xs, x>0 && rem (sumOfDivisors x) k == 0]) -- kudeto se smqta vsichko 2 puti (100% ima po-dobur nachin) 
        -- nvm namerih kak