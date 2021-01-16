import Data.List
import Data.Char
main :: IO()
main = do
    print $ encode "Haskell" == "Haskell"
    print $ encode "aaabccdefff" == "3abccde3f"
    print $ encode "aaaaaaaaaaaabbb" == "12a3b"
    print $ encode "aabbb" == "aa3b" 
    print $ encode "ffffaabbbyyyyyyyyyy" == "4faa3b10y" 
    print $ encode "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbccccddg" == "100a3b4cddg"


    print $ decode "b1234a" == "baaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    print $ encode (decode "1234a") == "1234a"


    print $ decode "Haskell" == "Haskell"
    print $ decode "12a3b" == "aaaaaaaaaaaabbb"
    print $ decode "100a3b4cddg" == "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaabbbccccddg"
    print $ decode "a3b" == "abbb"
    print $ decode "aa3b" == "aabbb"

countOccurrences :: String -> [(Int, Char)]
countOccurrences [] = error "Empty string"
countOccurrences xs = helper $ group xs
    where
        helper :: [String] -> [(Int, Char)]
        helper [] = []
        helper [x] = [(length x, head x)]
        helper (x:xs) = (length x, head x) : helper xs

encode :: String -> String
encode str = helper (countOccurrences str)
    where   
        helper :: [(Int, Char)] -> [Char]
        helper [] = []
        helper ((x, y):xs)
            |x<3 = (replicate x y) ++ helper xs 
            |otherwise = (show x) ++ y:helper xs

decode :: String -> String
decode [] = []
decode xs = helper "" xs
    where
        helper :: String -> String -> String
        helper _ [] = []
        helper num (x:xs) 
            | isDigit x = helper (x:num) xs
            | otherwise = if num /= "" then replicate (read (reverse num)) x ++ helper "" xs else x : helper "" xs