import Data.List
main :: IO()
main = do
    print $ closestToAverage store1 == "cheese"
    print $ cheaperAlternative store2 == 1



store1=[("bread",1),("milk",2.5),("lamb",10),("cheese",5),("butter",2.3)]
store2=[("bread",1),("cheese",2.5),("bread",1),("cheese",5),("butter",2.3)]

type Product = (String,Double)
type StoreAvailability = [Product]

storeAverage :: StoreAvailability -> Double
storeAverage [] = 0.0
storeAverage items = total / fromIntegral (length items)
    where
        total = sum [price | (_,price) <- items]

closestToAverage :: [Product] -> [Char]
closestToAverage []=[]
closestToAverage items = name
    where
        differences = map (\(name,price) -> (name,abs(avrg-price))) items
        avrg = storeAverage items
        (name,_) = foldl1 compareProducts differences 
        compareProducts p1@(_, price1) p2@(_, price2) = if price1 < price2 then p1 else p2


findCheaperAlternative :: Product -> StoreAvailability -> Int
findCheaperAlternative _ [] = 0
findCheaperAlternative product@(name,price) (product2@(name2,price2):xs)
    | name == name2 && price>price2 = 1 + findCheaperAlternative product xs
    | otherwise = findCheaperAlternative product xs





cheaperAlternative xs = sum (map (`findCheaperAlternative` store2) store2)
