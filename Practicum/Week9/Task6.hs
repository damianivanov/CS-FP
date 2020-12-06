main :: IO()
main = do
    print $ fib 11 == 89
    print $ fibIter 11 == 89
    print $ fibIter 7 == 43566776258854844738105

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib x = fib (x - 1) + fib (x - 2)

fibIter :: Int -> Integer
fibIter x = if x < 0 then error "x was negative" else helper 0 1 x
    where
        helper prev curr leftOver
            | leftOver == 0 = prev
            | leftOver == 1 = curr
            | otherwise = helper curr (prev + curr) (leftOver + 1)