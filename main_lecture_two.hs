-- f :: type
-- f pat1 = resul1
-- f pat2 = resul2
-- ...
-- f patN = resulN


-- f :: type
-- f ... = case var of
--     pat1 -> result1
--     pat2 -> result2
--     ...
--     patN -> resultN


-- not :: Bool -> Bool
-- not True = False
-- not False = True


-- isZero :: Int -> Bool
-- isZero 0 = True
-- isZero n = False


-- eval :: Char -> Int -> Int -> Int
-- eval op x y = case op of
--     '+' -> x + y
--     '-' -> x - y
--     '*' -> x * y
--     '/' -> div x y
--     _   -> 0


-- isEmpty :: [Int] -> Bool
-- isEmpty [] = True
-- isEmpty _  = False



-- sumOfTwoInThree :: [Int] -> Int
-- sumOfTwoInThree [x, _, y] = x + y
-- sumOfTwoInThree _         = 0


-- oneOrTwoZeroes :: [Int] -> Bool
-- oneOrTwoZeroes l = case l of
--     [0]    -> True
--     [0, 0] -> True
--     _      -> False


-- exactlyTwo :: [Int] -> Bool
-- exactlyTwo [_, _] = True
-- exactlyTwo _      = False


-- syntax sugar
-- [1, 2, 3]
-- 1 : 2 : 3 : []
-- 1 : (2 : (3 : []))


-- headOrDef :: Int -> [Int] -> Int
-- headOrDef def []    = def
-- headOrDef _ (x : _) = x


-- dropHead :: [Int] -> [Int]
-- dropHead []       = []
-- dropHead (_ : xs) = xs


-- secondIsZero :: [Int] -> Bool
-- secondIsZero (_ : 0 : _) = True
-- secondIsZero _           = False



-- sum :: [Int] -> Int
-- sum []       = 0
-- sum (x : xs) = x + sum xs





-- count :: Int -> [Int] -> Int
-- count n list = go 0 list
--     where
--         go :: Int -> [Int] -> Int
--         go result [] = result
--         go result (x:xs) 
--             | x == n     = go (result + 1) xs
--             | otherwise  = go  result      xs


-- the order of patterns matter
-- variable is a catch all pattern
-- patterns on variable names are not supported
-- patterns don't cover all cases


-- a function is total if it is defined for all 
-- inputs of its corresponding type, or in ohter 
-- words, if a function returns the output on any 
-- possible values of the input types

-- partial = not total

-- ghc warns about non-exhaustive or overlapping patterns







-- tuples
-- ('x', True)

-- splitAtPos3 :: [Int] -> ([Int], [Int])
-- splitAtPos3 l = (take 3 l, drop 3 l)



-- showTriple :: (Bool, Int, String) -> String
-- showTriple (b, n, string) =
--     if b
--     then "The number is: " ++ show n
--     else "The string is " ++ string 
-- worse because no partial application



-- algebraic data types
-- product type - combines types using both
-- sum type - choice of types, either one or another


-- tuples are product type


-- data User = MkUser String Int Bool
--     deriving (Show)

-- getUserName :: User -> String
-- getUserName (MkUser name _ _) = name

-- getUserAge :: User -> Int
-- getUserAge (MkUser _ age _) = age

-- setUserName :: String -> User -> User
-- setUserName name (MkUser _ age isTired) = MkUser name age isTired





-- creates top level functions, should add the prefixes to prevent name confilcts
-- data User = MkUser
    -- { userName    :: String
    -- , userAge     :: Int
    -- , userIsTired :: Bool
    -- }

-- john = MkUser {userAge = 29, userIsTired = True, userName = "John"}

-- userName john
-- > "John"


-- the age is the same as John
-- ivan = john {userName = "Ivan", userIsTired = False}




-- data Color
--     = Red
--     | Green
--     | Blue

-- showColor :: Color -> String
-- showColor color = case color of
--     Red   -> "red"
--     Green -> "green"
--     Blue  -> "blue"



-- data Result
--     = Error String
--     | Ok Int

-- divide :: Int -> Int -> Result
-- divide _ 0 = Error "Division by zero!"
-- divide x y = Ok (div x y)

-- showResult :: Result -> String
-- showResult (Error msg) = "Error: " ++ msg
-- showResult (Ok result) = "Ok: " ++ show result



-- data Property
--     = Padding Int
--     | Clickable Bool Int
--     | Description String



-- data IntList
--     = Empty
--     | Cons Int IntList

-- length :: IntList -> Int
-- length Empty = 0
-- length (Cons _ xs) = 1 + length xs

-- nzeroes :: Int -> IntList
-- nzeroes 0 = Empty
-- nzeroes n = Cons 0 (nzeroes (n - 1))



-- type MyTriples = [(Int, Bool, String)]
-- type IntPredicate = Int -> Bool


-- newtype - lightweight wrapper for an existing type
-- exactly one constructor
-- exactly one field

-- type Attack = Int
-- type Defence = Int
-- type Health = Int

-- newtype Attack = MkAttack Int
-- newtype Defence = MkDefence Int
-- newtype Health = MkHealth Int

-- damage :: Attack -> Defence -> Health -> Health
-- damage (MkAttack atk) (MkDefence def) (MkHealth hp) =
--     MkHealth (hp + def - atk)




-- parametric polymorphism
-- type variables start with lower case letters
-- dup :: a -> (a, a)
-- dup x = (x, x)


-- Hoogle

-- polymorphic types
-- data Chest a = MkChest
--     { chestGold     :: Int
--     , chestTreasure :: a
--     }


-- fromMaybeInt :: Maybe Int -> Int
-- fromMaybeInt Nothing  = 0
-- fromMaybeInt (Just n) = n


-- find :: (a -> Bool) -> [a] -> Maybe a
-- find (> 4) [3, 1, 2]


-- partitionEithers :: [Either a b] -> ([a], [b])
-- partitionEithers [Left 3, Right "Hi", Left 5]






-- Eta-reduction
-- showInt :: Int -> String
-- showInt n = show n
--         vvv
-- showInt :: Int -> String
-- showInt = show


-- onlyEven :: [Int] -> [Int]
-- onlyEven xs = filter even xs
--         vvv
-- onlyEven :: [Int] -> [Int]
-- onlyEven = filter even



-- zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
-- zipWith (*) [3, 1, 2] [10, 20, 30]

-- prod :: [Int] -> [Int] -> [Int]
-- prod xs ys = zipWith (*) xs ys
--          vvv
-- prod :: [Int] -> [Int] -> [Int]
-- prod = zipWith (*)

-- common parameters could be removed




-- function composition
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- uses partial application
-- map (even . length . words) ["hi all", " la la la", "the end"]



-- eta reduction again
-- takeEven5 :: [[a]] -> [[a]]
-- takeEven5 list = take 5 (filter (\l -> even (length l)) list)
--       vvv
-- takeEven5 list = take 5 (filter (\l -> (even . length) l) list)
--       vvv
-- takeEven5 list = take 5 (filter (even . length) list)
--       vvv
-- takeEven5 list = (take 5 . filter (even . length)) list
--       vvv
-- takeEven5 = take 5 . filter (even . length)


