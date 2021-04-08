module PE1 where

import Text.Printf


-- This function takes a Double and rounds it to 2 decimal places as requested in the PE --
getRounded :: Double -> Double
getRounded x = read s :: Double
               where s = printf "%.2f" x

-------------------------------------------------------------------------------------------
----------------------- DO NOT CHANGE ABOVE OR FUNCTION SIGNATURES-------------------------
------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
-------------------------------------------------------------------------------------------

convertTL :: Double -> String -> Double
convertTL money "USD" = getRounded (money / 8.18)
convertTL money "EUR" = getRounded (money / 9.62)
convertTL money "BTC" = getRounded (money / 473497.31)
convertTL money currency = 0

-------------------------------------------------------------------------------------------
countOnWatchHelper :: [String] -> String -> Int -> Int -> Int
countOnWatchHelper schedule employee 1 counter = if employee /= head schedule then counter
                                                                              else (counter + 1)
countOnWatchHelper schedule employee days counter = if employee == head schedule then countOnWatchHelper (tail schedule) employee (days-1) (counter+1)
                                                                                 else countOnWatchHelper (tail schedule) employee (days-1) counter

countOnWatch :: [String] -> String -> Int -> Int
countOnWatch schedule employee 0 = 0
countOnWatch schedule employee days = countOnWatchHelper (cycle schedule) employee days 0


-------------------------------------------------------------------------------------------

encryptHelper :: Int -> Int
encryptHelper x = if x `mod` 3 == 0 then (x-1)
                                    else if x `mod` 4 == 0 then ((x*2) `mod` 10)
                                                           else if x `mod` 5 == 0 then ((x+3) `mod` 10)
                                                                                  else ((x+4) `mod` 10)

encrypt :: Int -> Int
encrypt x = (encryptHelper (div x 1000)) * 1000 + (encryptHelper (div x 100 - (div x 1000)*10)) * 100 + (encryptHelper (div x 10 - (div x 100)*10)) * 10 + (encryptHelper (div x 1 - (div x 10)*10))

-------------------------------------------------------------------------------------------

rateFinder :: (Double, Int) -> Double
rateFinder (money, year)
    | money >= 10000 && year >= 2 = 0.115
    | money >= 10000 && year < 2 = 0.105
    | money < 10000 && year >= 2 = 0.095
    | money < 10000 && year < 2 = 0.09

compoundInterests :: [(Double, Int)] -> [Double]
compoundInterests investments = [getRounded ((fst x) * (1 + (rateFinder x) / 12) ^ (12 * snd x)) | x <- investments]
