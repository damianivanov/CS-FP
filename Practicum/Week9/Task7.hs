main :: IO()
main = do
    print $ perfect 1 == False
    print $ perfect 6 == True
    print $ perfect 495 == False
    print $ perfect 33550336 == True
    print $ perfectXs 1 == False
    print $ perfectXs 6 == True
    print $ perfectXs 495 == False
    print $ perfectXs 33550336 == True


sumDivs :: Int -> Int
sumDivs x = helper 1 0
    where 
        helper curr result
            | curr == x = result 
            | mod x curr == 0 = helper (curr + 1) (result + curr)
            | otherwise = helper (curr + 1) result

perfectXs :: Integral a => a -> Bool
perfectXs x = x == (sum $ filter (\i -> mod x i == 0) [1 .. x - 1])

perfect :: Int -> Bool
perfect x = x >=0 && (sumDivs x) == x
