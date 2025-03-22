module Partf where

applyTwice :: (Integer -> Integer) -> Integer -> Integer
applyTwice f x = f (f x)

-- ghci> applyTwice (+ 10) 3
-- 23