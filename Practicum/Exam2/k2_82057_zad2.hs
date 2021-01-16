main ::IO()
main= do
    print $ dominates (+4) (*2) [1..4] -- > True
    print $ dominates (+4) (*2) [1..5] -- > False (5+4=9 < 5*2=10) 
      
    print $ dominates (*3) (*2) [1..10] -- > True    
    print $ dominates (*2) (+4) [1..5] -- > False    





dominates :: (Int -> Int) -> (Int -> Int) -> [Int] -> Bool
dominates _ _ [] = True
dominates f g xs = length (filter (\x -> f x >= g x) xs) == length  xs