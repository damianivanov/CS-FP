main ::IO()
main = do
    print $ findNb 1071225 -- > 45
    print $ findNb 40539911473216 -- > 3568
    print $ findNb 135440716410000 -- > 4824
    print $ findNb 4183059834009 -- > 2022
    print $ findNb 91716553919377 -- > -1
    print $ findNb 24723578342962 -- > -1
    print $ findNb 1 -- > 1
    -- print $ findNb (-12323) -- > error

findNbHelper :: Integer -> Integer -> Integer
findNbHelper m n 
    | (m - n*n*n) < 0 = -1
    | (m - n*n*n) == 0 = n
    |otherwise = findNbHelper (m-n*n*n) (n+1)

findNb :: Integer -> Integer
findNb m 
    |m>0 = findNbHelper m 1
    |otherwise = error "m should be positive number"