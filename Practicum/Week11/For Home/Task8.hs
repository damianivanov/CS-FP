main :: IO()
main = do
    --print $ map (* 3) (h [1..10]  [1..10] ((-) (-4)) (* (-2))) -- purvi etap
    --print $ map (* 3) ((\x -> filter (\y -> ((-) (-4)) y > ((* (-2)) y) ) x) [1..10]) -- loshoto e che tova ne znam kak da implementiram vuv funkcia --nvm
    --print $ (rf ((-) (-4)) (* (-2))) [1..10] -- taka raboti
    print $ (rf ((-) (-4)) (* (-2))) [1..10] (* 3) == [15,18,21,24,27,30] -- only 5, 6, 7, 8, 9 and 10 satisfy the condition --stana
-- dosta proba greshka padna, a kolko lesno se okaza

rf :: Ord a1 => (a2 -> a1) -> (a2 -> a1) -> [a2] -> (a2 -> b) -> [b] --generirano ot intellisense-a
rf f g = (\ x z -> map z (filter (\y -> f y > g y) x))

--(\x -> filter (\y -> f y > g y) x)

--purvi etap
--h [] [] _ _ = []
--h (x:xs) (y:ys) f g = if (f x) > (g y) then x : h xs ys f g else h xs ys f g
