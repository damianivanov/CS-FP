main :: IO()
main = do 
    print $ sumRats (2, 5) (5, 2) == (29, 10)
    print $ sumRats (52, 123) (96, 14) == (6268, 861)
    print $ sumRats (2, 5) (3, 5) == (1, 1)

    print $ multiplyRats (2, 5) (5, 2) == (1, 1)
    print $ multiplyRats (52, 123) (96, 14) == (832, 287)
    print $ multiplyRats (2, 5) (3, 5) == (6, 25)

    print $ divideRats (2, 5) (5, 2) == (4, 25)
    print $ divideRats (52, 123) (96, 14) == (91, 1476)
    print $ divideRats (2, 5) (3, 5) == (2, 3)

    print $ areEqual (2, 5) (5, 2) == False
    print $ areEqual (52, 123) (52 * 3, 123 * 3) == True
    print $ areEqual (2, 6) (5, 15) == True

type Rat = (Int,Int)

normalize :: Rat -> Rat
normalize (x,y) = if y==0 then error "division by 0" else (div x k, div y k)
 where
    k :: Int
    k = gcd x y

sumRats :: Rat -> Rat -> Rat
sumRats (a, b) (x, y) = normalize (a*y + b*x,b*y) 

multiplyRats :: Rat -> Rat -> Rat
multiplyRats (a, b) (x ,y) = normalize(a*x,b*y)

divideRats ::Rat->Rat->Rat
divideRats (a, b) (x ,y) = normalize(a*y,b*x)

areEqual ::Rat -> Rat -> Bool
areEqual (a, b) (x, y) =normalize(a,b) == normalize(x,y) 