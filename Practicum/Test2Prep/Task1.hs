import Data.List
main :: IO()
main = do
    print $ reverseOrdSuff 37563 -- → 36
    print $ reverseOrdSuff 32763 -- → 367
    print $ reverseOrdSuff 32567 -- → 7
    print $ reverseOrdSuff 32666 -- → 6

reverseInt :: Int -> Int
reverseInt = read . reverse . show

ordSuff :: Int -> Int
ordSuff 0 = 0
ordSuff k 
    | x < y = x + (ordSuff (div k 10)*10)
    | otherwise =  x 
        where 
            x = mod k 10
            y = div (mod k 100) 10

reverseOrdSuff :: Int -> Int
reverseOrdSuff 0 = error "the number should be more than 0"
reverseOrdSuff k  = reverseInt(ordSuff k)


