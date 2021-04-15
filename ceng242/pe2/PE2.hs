module PE2 where

---------------------------------------------------------------------------------------------
------------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
--------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
--------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
---------------------------------------------------------------------------------------------

-- Note: undefined is a value that causes an error when evaluated. Replace it with
-- a viable definition! Name your arguments as you like by changing the holes: _

--------------------------
-- Part I: Time to inf up!

-- naturals: The infinite list of natural numbers. That's it!
naturals :: [Integer]
naturals = [0, 1..]

-- interleave: Interleave two lists, cutting off on the shorter list.
interleaveHelper :: [a] -> [a] -> [a] -> [a]
interleaveHelper [] _ oldlist = oldlist
interleaveHelper _ [] oldlist = oldlist
interleaveHelper flist slist oldlist = oldlist ++ [head flist, head slist] ++ interleaveHelper (tail flist) (tail slist) oldlist

interleave :: [a] -> [a] -> [a]
interleave flist slist = interleaveHelper flist slist []

-- integers: The infinite list of integers. Ordered as [0, -1, 1, -2, 2, -3, 3, -4, 4...].
integers :: [Integer]
integers = interleave naturals [-1, -2..]

--------------------------------
-- Part II: SJSON Prettification

-- splitOn: Split string on first occurence of character.
splitOn :: Char -> String -> (String, String)
splitOn _ _ = undefined

-- tokenizeS: Transform an SJSON string into a list of tokens.
tokenizeS :: String -> [String]
tokenizeS _ = undefined

-- prettifyS: Prettify SJSON, better tokenize first!
prettifyS :: String -> String
prettifyS _ = undefined

-- Good luck to you, friend and colleague!
