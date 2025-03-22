module Whr where

appendLastTwos :: [Int] -> [Int] -> [Int]
appendLastTwos list1 list2 = lastTwo list1 ++ lastTwo list2
    where 
        lastTwo :: [Int] -> [Int]
        lastTwo l = reverse (take 2 (reverse l))