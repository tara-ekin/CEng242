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

splitOnHelperRight :: Char -> String -> String
splitOnHelperRight ch "" = ""
splitOnHelperRight ch st = if ch /= head st 
                              then splitOnHelperRight ch (tail st)
                              else (tail st)

splitOnHelperLeft :: Char -> String -> String
splitOnHelperLeft ch "" = ""
splitOnHelperLeft ch st = if ch /= head st
                             then [head st] ++ splitOnHelperLeft ch (tail st)
                             else ""
                             
splitOn :: Char -> String -> (String, String)
splitOn ch st = (splitOnHelperLeft ch st, splitOnHelperRight ch st)

-- tokenizeS: Transform an SJSON string into a list of tokens.
tokenizeS :: String -> [String]
tokenizeS "" = []
tokenizeS st
    | (head st == '{') || (head st == '}') || (head st == ':') || (head st == ',') = 
        [[head st]] ++ tokenizeS (tail st)
    | (head st == '\'') =
        [fst (splitOn '\'' (tail st))] ++ tokenizeS (snd (splitOn '\'' (tail st)))
    | (head st == '\t') || (head st == '\n') || (head st == ' ') = 
        tokenizeS (tail st)

-- prettifyS: Prettify SJSON, better tokenize first!
prettifyS :: String -> String
prettifyS _ = undefined

-- Good luck to you, friend and colleague!

