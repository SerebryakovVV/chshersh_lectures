module Letin where

-- let var1 = expr1
--     var2 = expr2
--     ...
-- in result

sameThreeAround :: [Int] -> Bool
sameThreeAround list =
    let firstThree = take 3 list
        lastThree  = reverse (take 3 (reverse list))
    in firstThree == lastThree