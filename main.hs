-- functions in programming can hang, have side effect, throw exceptions, terminate early

-- define, call, compose, pass as an argument, inspect

-- - higher order functions
-- - algebraic data types
-- - pattern mathcing
-- - purity
-- - immutability
-- - totality
-- - laziness

-- haskell features
-- - static typing
-- - polymorphisms
-- - type inference
-- - layout sensitivity
-- - ml syntax
-- - automatic currying
-- - garbage collection
-- - green threads
-- - software transaction memory

-- repl - read eval print loop


-- comparison
-- ==
-- /=



-- function call
-- functionName arg1 arg2 arg3
-- max (min 2 4) (min (-3) 3)

-- types
-- :t / :type - command for getting the type of
-- works with values not types

-- numeric constants are polymorphic by default
-- :t +d 32

-- not :: Bool -> Bool

-- operators are just functions


-- [1, 2] ++ [3, 4, 5]
-- 5 : [6, 7, 8]


-- functions over lists
-- head, tail, last, init
-- ^^^ return exceptions on empty lists

-- reverse, take, drop, null, elem, concat
-- length - very slow
-- [3, 4, 5] !! 0  -  indexing into a list, very slow too


-- [1..10]
-- [1, 3 .. 19] - step of two
-- for the opposit direction need to specify the step
-- [10, 9 .. 1]
-- infinite list
-- [0..]

-- take 3 [0 .. ]
-- take 3 (drop 5 [0..])

-- [5, head [], 7] !! 2  -  doesn't throw an exception because of the laziness



-- strings are list of characters
-- functions: words, unwords


-- functionName :: type
-- funcitonName arg1 ... argN = result


-- ghci Module.hs
-- :l Module.hs


-- module - a collections of functions
-- package - a collection of modules + metadata
-- hackage - a central repository of haskell packages
-- base - standard haskell library
-- prelude - the module from base imported by default


-- import Data.List


-- if then else  -  else should always be specified  -  condition file

-- guards  -  guards file

-- let in  -  letin file

-- where  -  whr file




-- recursion instead of mutability  -  count file


-- first class functions  -  fcf file


-- lambda functions  -  lamb file


-- partial function application  -  partf
-- div12By = div 12
-- div12By 3
-- > 4
-- standard Higher Order Functions
-- map, filter, any, concatMap, iterate

-- can have functions inside of containers
-- head [(*2), div 12, (+10)] 5
-- > 10
-- returns the first one and applies it
-- functions are automatically curried



-- some commands for ghci
-- :q, :t, :t +d, :l, :i