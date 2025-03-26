-- parametric polymorphism - same behavior for different types

-- ad-hoc polymorphism - different behavior for different types


-- typeclasses  -  like an interface, defines a set of functions that must be implemented
class Display a where
    display :: a -> String
-- implemenation
instance Display Bool where
    display False = "false"
    display True = "true"

instance Display Char where
    display c = [c]

-- constaraint specifier
greet :: Display a => a -> String
greet val = "Hello, " ++ display val

displayBoth :: (Display a, Display b) => a -> b -> String
displayBoth a b = display a ++ " and " ++ display b



-- data - what is stored inside
-- class - what we can do with this
-- instance - how we implement this behavior for that data


-- default implementation in the typeclass
-- minimal pragma
class Display a where
    display :: a -> String

    displayList :: [a] -> String
    displayList l = 
        "[" ++ intercalate ", " (map display l) ++ "]"


-- {-# LANGUAGE #-}
-- language pragma

-- {-# LANGUAGE InstanceSigs #-}
-- type signatures for the instances



-- standard typeclasses
-- Eq
-- Ord
-- Show
-- Read
-- Bounded
-- Enum
-- Num

-- can make new type an instance of it
-- instance Show Color where...

-- minimal pragma



-- class (Eq a) => Ord a where



-- check x y = x + y < x * y
-- :t check
-- check :: (Ord a, Num a) => a -> a -> Bool

-- ghci> :t sum
-- sum :: (Foldable t, Num a) => t a -> a
-- no arrow, t is a container



-- data Color
    -- = Red
    -- | Green
    -- | Blue
    -- deriving (Eq, Ord, Show, Read, Enum, Bounded, Ix)




-- {-# LANGUAGE GeneralizedNewtypeDeriving #-}



-- class Semigroup a where
--     (<>) :: a -> a -> a
-- closure and associativity



-- newtype Any = Any { getAny :: Bool }
-- newtype All = All { getAll :: Bool }

-- instance Semigroup Any where
--     Any x <> Any y = Any (x || y)

-- instance Semigroup All where
--     All x <> All y = All (x && y)



-- monoid
-- class Semigroup a => Monoid a where
--     mempty :: a

-- right and left identity, empty element




-- kind - a type of a type
-- :k Int
-- Int :: *

-- :k Either
-- Either :: * -> * -> *

-- :k (->)
-- (->) :: * -> * -> *

-- type constructors, not complete types, need to apply them to some type
-- [] by itself is a type constructor (it needs one more type to become a full type).

-- this gives an error
-- maybeToList :: Maybe -> [a]
-- expects two types of kind *, gets * -> * in the maybe

-- type constructors can be partially applied

-- haskell allows polymorphism ovet type constructors




-- class Singleton f where
--     singleton :: a -> f a

-- :t singleton
-- singleton :: Singleton f => a -> f a

-- from this definition we deduce that its for type constructor (Maybe, [], etc.) and not for int for example,
-- valus types inside the type constructor should be the same

-- instance Singleton Maybe where
--     singleton :: a -> Maybe a
--     singleton x = Just x

-- instance Singleton [] where
--     singleton :: a -> [a]
--     singleton x = [x]

-- singleton 3 :: Maybe Int
-- > Just 3

-- sigleton 3 :: [Int]
-- > [3]



-- Functor
-- class Functor f where
    -- fmap :: (a -> b) -> f a -> f b
-- mapping valuse inside context f


-- fmap is generalisation of map

-- :t map
-- map :: (a -> b) -> [a] -> [b]

-- :t fmap
-- fmap :: Functor f => (a -> b) -> f a -> f b