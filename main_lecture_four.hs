-- maybePlus :: Maybe Int -> Maybe Int -> Maybe Int
-- maybePlus ma mb = case ma of
--     Nothing -> Nothing
--     Just a  -> case mb of
--         Nothing -> Nothing
--         Just b  -> Just (a + b)



-- andThen :: Maybe a -> (a -> Maybe b) -> Maybe b
-- andThen ma f = case ma of 
--     Nothing -> Nothing
--     Just x  -> f x


-- maybePlus :: Maybe Int -> Maybe Int -> Maybe Int
-- maybePlus ma mb = andThen ma (\a -> andThen mb (\b -> Just (a + b)))



-- monad in haskell is a generalization of the andThen pattern




-- class Monad m where 
    -- return :: a -> m a
    -- (>>=)  :: m a -> (a -> m b) -> m b

-- bind operator
-- monad is a typeclass
-- typeclass for type constructor like Maybe



-- instance Monad Maybe where
--     return :: a -> Maybe a
--     return x = Just x

--     (>>=) :: Maybe a -> (a -> Maybe b) -> Maybe b
--     Nothing >>= _ = Nothing
--     Just x  >>= f = f x


-- LAWS:
-- left identity
-- right identity
-- associativity


-- ghci> :t (>>=)
-- (>>=) :: Monad m => m a -> (a -> m b) -> m b


-- robot monkey operator



-- refctor
-- maybePlus :: Maybe Int -> Maybe Int -> Maybe Int
-- maybePlus ma mb = andThen ma (\a -> andThen mb (\b -> Just (a + b)))

-- backtiks operator
-- maybePlus :: Maybe Int -> Maybe Int -> Maybe Int
-- maybePlus ma mb = ma `andThen` (\a -> mb `andThen` (\b -> Just (a + b)))

-- maybePlus :: Maybe Int -> Maybe Int -> Maybe Int
-- maybePlus ma mb = ma `andThen` \a -> mb `andThen` \b -> Just (a + b)

-- maybePlus :: Maybe Int -> Maybe Int -> Maybe Int
-- maybePlus ma mb = ma >>= \a -> mb >>= \b -> return (a + b)

-- monadPlus :: Monad m => m Int -> m Int -> m Int
-- monadPlus ma mb = ma >>= \a -> mb >>= \b -> return (a + b)




-- monad has a superclass of applicative, which has a superclass of functor
-- pure instead of return


-- IO


-- getTwoLines :: IO [String]
-- getTwoLines = getLine >>= \line1 -> getLine >>= \line2 -> pure [line1, line2]


-- () - unit type







-- module Main where

-- main :: IO ()
-- main = putStrLn "Hello, world!"


-- >> operator
-- (>>) :: Monad m => m a -> m b -> m b
-- action1 >> action2 = action1 >>= \_ -> action2

-- main = putStrLn "stuff" >>= \_ -> putStrLn "more stuff"

-- main = putStrLn "stuff" >> putStrLn "more stuff"



-- do notation
-- example1 = 
--     fun1 >>= \result -> fun2 result

-- example1 = do
--     result <- fun1
--     fun2 result

-- -- eta-reduced
-- example1 = fun1 >>= fun2



-- example2 = fun1 >> fun2

-- example2 = do
--     fun1
--     fun2



-- example3 = let x = f y in fun x

-- example3 = do
--     let x = f y
--     fun x










-- main :: IO ()
-- main = 
--     getLine >>= \line ->
--     let rev = reverse line in
--     putStrLn rev


-- main :: IO ()
-- main = do
--     line <- getLine
--     let rev = reverse line
--     putStrLn rev


