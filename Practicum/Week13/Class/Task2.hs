main :: IO()
main = do 
    --print $ db
    --print $ getTotal == 31.2
    print $ "Buying 500 bread:"
    print $ buy "bread" 500 db
    print $ "Buying 500 water:"
    print $ buy "water" 500 (buy "bread" 500 db)
    print $ "Buying 100 soap:"
    print $ buy "soap" 100 (buy "water" 500 (buy "bread" 500 db))
    print $ "Buying 500 bread:"
    print $ buy "bread" 500 (buy "soap" 100 (buy "water" 500 (buy "bread" 500 db)))
    --print $ buy "water" 100 $ buy "bread" 500 $ buy "soap" 100 $ buy "water" 500 $ buy "bread" 500 db -- Should give an error.
    --print $ buy "soap" 200 $ buy "bread" 500 $ buy "soap" 100 $ buy "water" 500 $ buy "bread" 500 db -- Should give an error.

type Product = (String,Int,Double)
type Shop = [Product]

db :: Shop
db = [("bread",1000,1.20),("milk",2000,4.50),("lamb",5000,10.00),("cheese",750,5.00),("water",500,0.50),("soap",250,4.50),("butter",1000,5.50)]

getTotal :: Double
getTotal = sum $ map (\(_,_,price) -> price) db

buy :: String -> Int -> Shop -> Shop
buy name _ [] = error ("out of stock" ++ name)
buy name amount (x@(currentName,currentAmount,currentPrice):xs)
    | currentName == name && currentAmount == amount = xs
    | currentName == name && currentAmount < amount = error ("Not enough " ++ name ++" in stock!")
    | currentName == name = (currentName,currentAmount-amount,currentPrice) : xs
    | otherwise = x : buy name amount xs
