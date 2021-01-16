main :: IO()
main = do
    print $ checkRoot [(5, 25), (6, 36), (7, 47), (8, 88)] == [True, True, False, False]
    print $ checkRootHf [(5, 25), (6, 36), (7, 47), (8, 88)] == [True, True, False, False]
checkRoot :: [(Int,Int)] -> [Bool]
checkRoot xs = [x * x == y | (x, y) <- xs]    
--checkRoot xs = [(fst x, snd x) == (fst x, fst x*fst x) |x <- xs] 

checkRootHf :: [(Int,Int)] -> [Bool]
checkRootHf xs = map (\ (x ,y) -> x * x == y ) xs 