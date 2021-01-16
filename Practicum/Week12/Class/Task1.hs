main :: IO()
main = do
    print $ Circle 5
    print $ Rectangle 5 20
    print $ Triangle 3 4 5
    print $ Cylinder 5 3


data Shape = Circle Int 
            | Rectangle Int Int 
            | Triangle Int Int Int 
            | Cylinder Int Int
 deriving (Show)  
