module Lamb where

satisfies :: (Int -> Bool) -> Int -> String
satisfies check n
    | check n   = "The number " ++ show n ++ " passes the check"
    | otherwise = "The number " ++ show n ++ " doesn't pass"

-- if predicate returns true the first hand runs

-- satisfies (\x -> x > 0) 5