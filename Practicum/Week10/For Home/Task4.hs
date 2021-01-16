import Data.Char
import Data.List

main :: IO()
main = do 
    print $ reverseOrdSuff 37563 == 36
    print $ reverseOrdSuff 32763 == 367
    print $ reverseOrdSuff 32567 == 7
    print $ reverseOrdSuff 32666 == 6
    
    print $ reverseOrdSuff 000000 == 0
    print $ reverseOrdSuff 00210000 == 12
    print $ reverseOrdSuff 02000021 == 12


rev :: Int -> Int
rev n = read $ reverse $ show n

isAscending :: Int -> Bool
isAscending n = getXs == nubBy (>=) getXs
    where
        getXs = map digitToInt $ show n

reverseOrdSuff :: Int -> Int
reverseOrdSuff x = if isAscending (rev x) then rev x else helper (rev x)
    where
        helper n
            | n < 10 || isAscending n = n
            | otherwise = helper (div n 10)