main :: IO()
main = do
    print $ combine [(1, 2), (1, 2)] == (11, 22)
    print $ combine [(3, 9), (8, 7), (7, 9), (8, 8), (5, 0), (9, 2)] == (377802, 989859)

combine :: [(Int,Int)] -> (Int,Int)
combine xs = if null xs then error "list is empty" else helper (reverse xs) (0,0) 1 --reverse-vam go za da moga da zapochna ot chislata v obraten red v krainiq tuple, za da izpolzvam stepenite na 10
    where
        helper :: [(Int,Int)] -> (Int,Int) -> Int -> (Int,Int)
        helper [] (a,b) _ = (a,b) 
        helper ((x,y):xs) (a,b) k = helper xs (a+(min x y*k),b+max x y *k) (k*10) -- ys zashtoto 'shadow cast' argumenta na combine function (ima li situacia v koqto tova moje da bude problem)