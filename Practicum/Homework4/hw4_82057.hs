main :: IO ()
main = do
  print $ getAverageBalance (accounts1, people1) (\(_, _, city) -> city == "Burgas") == 24.95
  print $ getAverageBalance (accounts1, people1) (\(_, (n : _), _) -> n == 'P') == 18.85

  print $ averageBalanceOfCities (accounts1, people1) ["Sofia", "Gabrovo", "Stara Zagora"] == 67.85
  print $ averageBalanceOfCities (accounts1, people1) ["Sofia"] == 67.85
  print $ averageBalanceOfCities (accounts1, people1) ["Burgas","Plovdiv"] == 23.62

  print $ countInteresting t1 == 2 --(4=2^2, 1=2^0)
  print $ countInteresting t2 == 3 --(4=2^2, 2=2^1, 1=2^0)

-- AccountId,PersonId,Balance
type Account = (Int, Int, Double)
--PersonId,Name,Town
type Person = (Int, String, String)
type Bank = ([Account], [Person])

people1 = [(1, "Ivan", "Sofia"), (2, "Georgi", "Burgas"), (3, "Petar", "Plovdiv"), (4, "Petya", "Burgas")]
accounts1 = [(1, 1, 12.5), (2, 1, 123.2), (3, 2, 13.0), (4, 2, 50.2), (5, 2, 17.2), (6, 3, 18.3), (7, 4, 19.4)]

roundTwoDigits :: Double -> Double
roundTwoDigits x = fromInteger  (round (x*100)) / 100

getAverageBalance :: Bank -> (Person -> Bool) -> Double
getAverageBalance (_, []) _ = 0.0
getAverageBalance ([],_) _ = 0.0
getAverageBalance (accounts, people) p = roundTwoDigits(sum list / fromIntegral (length list))
  where
    list = [balance | (_,pId,balance) <- accounts,(pid,_,_) <- filter p people, pId==pid]

averageBalanceOfCities :: Bank -> [String] -> Double
averageBalanceOfCities (_, []) _ = 0.0
averageBalanceOfCities ([],_) _ = 0.0
averageBalanceOfCities (_, _) [] = 0.0
averageBalanceOfCities (accounts, people) cities = if isNaN list then 0 else list
  where
      peopleRes  = [person | person@(_,_,city) <- people,c<-cities,c==city]
      list = getAverageBalance (accounts, peopleRes) (\(_, _, _) -> True)
------------Task2-----------------

data BTree = Empty | Node Int BTree BTree
 deriving (Eq)
t1 :: BTree 
t1 = Node 16 (Node 0 Empty Empty) (Node 4 (Node 1 Empty Empty) (Node 0 Empty Empty))

t2 :: BTree
t2 = Node 4 (Node 0 Empty Empty) (Node 2 (Node 1 Empty Empty)  Empty)

--- 2^k => k [0,2] (защото е binary tree) => value [1,4]
-- countInteresting :: BTree -> Int
-- countInteresting Empty = 0
-- countInteresting (Node value left right)
--   | (left == Empty && right == Empty && value == 1) 
--     || (value == 2 && ((left == Empty && right /= Empty) || (left /= Empty && right == Empty))) 
--     || (left /= Empty && right /= Empty && value == 4) = 1 + countInteresting left + countInteresting right
--   | otherwise = countInteresting left + countInteresting right

countInteresting :: BTree -> Int
countInteresting Empty = 0
countInteresting (Node 1 Empty Empty) = 1
countInteresting (Node 2 left Empty) = 1 + countInteresting left
countInteresting (Node 2 Empty right) = 1 + countInteresting right
countInteresting (Node 4 left right) = 1 + countInteresting left + countInteresting right
countInteresting (Node _ left right) = countInteresting left + countInteresting right