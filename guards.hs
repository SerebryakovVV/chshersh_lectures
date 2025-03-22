module Guards where

sign :: Int -> String
sign n
    | n == 0     = "Zero"
    | n < 0      = "Negative"
    | otherwise  = "Positive"