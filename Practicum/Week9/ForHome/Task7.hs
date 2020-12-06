main :: IO()
main = do
    print $ isPrime 1 == False
    print $ isPrime 2 == True
    print $ isPrime 3 == True
    print $ isPrime 6 == False
    print $ isPrime 61 == True
    print $ isPrime 28423087477 == True --123456789th prime number ===  exited with code=0 in 1.916 seconds
    --print $ isPrimeList 28423087477 == True --123456789th prime number  === exited with code=0 in 1.2 seconds
    
    --print $ isPrimeListN 28423087477 == True --123456789th prime number  === exited with code=1 in 371.637 seconds
    --print $ isPrimeN 28423087477 == True --123456789th prime number ===  exited with code=1 in 268.982 seconds/2.5GB RAM и дори не го завърши

--guards Not Optimized
isPrimeN :: Int -> Bool
isPrimeN x = if x < 2 then False else helper 2
    where
        helper currDiv
            | currDiv == x = True
            | (x `mod` currDiv) == 0 = False
            | otherwise = helper (currDiv + 1)

isPrime :: Int -> Bool
isPrime x = if x < 2 then False else helper 2
    where
        helper currDiv
            | currDiv == (ceiling.sqrt.fromIntegral) x = True
            | (x `mod` currDiv) == 0 = False
            | otherwise = helper (currDiv + 1)
--list
--Idea: прави лист от всички числа, които делят X и проверяваме дали дължината на листа е 0 
isPrimeList :: Int -> Bool 
isPrimeList z = null[ x | x <- [2..(ceiling.sqrt.fromIntegral) z], z `mod` x == 0] -- (ceiling.sqrt.fromIntegral) z го google-нах признавам 

--list Not Optimized
isPrimeListN :: Int -> Bool 
isPrimeListN z = null[ x | x <- [2..z], z `mod` x == 0]