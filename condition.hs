module Condition where

headOrDefault :: Int -> [Int] -> Int
headOrDefault def list = 
    if null list 
    then def 
    else head list