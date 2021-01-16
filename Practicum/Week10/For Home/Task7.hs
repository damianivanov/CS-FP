import Data.Char
import Data.List
main::IO()
main = do
    print $ reduceStr "dabAcCaCBAcCcaDD"
    print $ reduceStr "dabAcCaCBAcCcaDD" == "dabCBAcaDD" -- dabAcCaCBAcCcaDD -> dabAaCBAcCcaDD -> dabCBAcCcaDD -> dabCBAcaDD

reduceStr :: String -> String
reduceStr xs = helper xs []
    where
        areDuplicates x y = toLower x == toLower y && (isUpper x && isLower y || isUpper y && isLower x)
        helper :: String -> String -> String
        helper [] result = result
        helper [x] result = result ++ [x]
        helper (x:y:xs) result 
            | areDuplicates x y = reduceStr (result ++ xs)
            | otherwise = helper (y:xs) (result ++ [x])
