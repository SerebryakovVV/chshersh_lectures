module Fcf where

applyToSame :: (Int -> Int -> Int) -> Int -> Int
applyToSame  f x = f x x

-- ghci> applyToSame (+) 3
-- 6