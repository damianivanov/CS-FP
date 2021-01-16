main :: IO()
main = do
    print $ splitPoints (1,1) 5 [(1,2),(2,3),(10,15),(-1,1),(12,14)] -- > ([(1.0,2.0),(2.0,3.0),(-1.0,1.0)],[(10.0,15.0),(12.0,14.0)])

type Point = (Double,Double)


pointInCircle :: Point -> Double -> Point -> Bool
pointInCircle (x,y) r (x1,y1) 
    | x+r<=abs x1 && y+r<=abs y1 = True
    | otherwise= False

splitPoints :: Point -> Double -> [Point] -> ([Point],[Point])
splitPoints point@(x,y) r ps =  (filter (not . pointInCircle point r) ps,filter (pointInCircle point r) ps)