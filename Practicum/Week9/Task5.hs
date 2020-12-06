main :: IO()
main = do
    print $ fact 11 == 39916800
    print $ factXs 11 == 39916800
    print $ factIter 11 == 39916800
    -- factIter (-1)

fact :: Int -> Int
fact x 
    | x < 0 = error "x was negative"
    | x == 0 = 1
    | otherwise = x * fact (x-1) 


factXs :: Int -> Int
factXs x = product [1 .. x]

factIter :: Int -> Int
factIter x = if x < 0 then error "x was negative" else helper 1 x 
    where   
        helper result leftOver
            | leftOver < 2 = result
            | otherwise  = helper (result * leftOver) (leftOver - 1)