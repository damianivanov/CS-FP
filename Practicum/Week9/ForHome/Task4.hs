main :: IO() 
main = do
    print $ isPalindrome 6 == True
    print $ isPalindrome 1010 == False
    print $ isPalindrome 505 == True
    print $ isPalindrome 123321 == True
    print $ isPalindrome 654 == False

myReverse :: Int -> Int 
myReverse x = if x < 0 then error "x has to be positive" else helper x 0
    where
        helper leftOver res
            | leftOver < 10 = res*10 + leftOver
            | otherwise = helper (div leftOver 10) ((res * 10) + (leftOver `mod` 10))

isPalindrome :: Int -> Bool
isPalindrome  x = x == myReverse x   