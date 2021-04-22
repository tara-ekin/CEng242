module PE3 where

data Cell = SpaceCraft Int | Sand | Rock Int | Pit deriving (Eq, Read, Show)

type Grid = [[Cell]]
type Coordinate = (Int, Int)

data Move = North | East | South | West | PickUp | PutDown deriving (Eq, Read, Show)

data Robot = Robot { name :: String,
                     location :: Coordinate,
                     capacity :: Int,
                     energy :: Int,
                     storage :: Int } deriving (Read, Show)

-------------------------------------------------------------------------------------------
--------------------------------- DO NOT CHANGE ABOVE -------------------------------------
------------- DUMMY IMPLEMENTATIONS ARE GIVEN TO PROVIDE A COMPILABLE TEMPLATE ------------
------------------- REPLACE THEM WITH YOUR COMPILABLE IMPLEMENTATIONS ---------------------
-------------------------------------------------------------------------------------------
-------------------------------------- PART I ---------------------------------------------

isInGrid :: Grid -> Coordinate -> Bool
isInGrid grid coor = if (0 <= (fst coor)) && (fst coor <= (length grid)) && (0 <= (snd coor)) && ((snd coor) <= (length(grid!!0)))
                        then True
                        else False

-------------------------------------------------------------------------------------------

rockCount :: Cell -> Int
rockCount (Rock a) = a
rockCount _ = 0

countRockHor :: [Cell] -> [Int]
countRockHor inpLine = map (rockCount) (inpLine)

countRockVer :: [[Cell]] -> [[Int]]
countRockVer inpGrid = map countRockHor inpGrid

totalCount :: Grid -> Int
totalCount grid = sum (map sum (countRockVer grid))

-------------------------------------------------------------------------------------------

coordinatesOfPits :: Grid -> [Coordinate]
coordinatesOfPits grid = []

-------------------------------------------------------------------------------------------

tracePath :: Grid -> Robot -> [Move] -> [Coordinate]
tracePath grid robot moves = []

------------------------------------- PART II ----------------------------------------------

energiseRobots :: Grid -> [Robot] -> [Robot]
energiseRobots grid robots = robots

-------------------------------------------------------------------------------------------

applyMoves :: Grid -> Robot -> [Move] -> (Grid, Robot)
applyMoves grid robot moves = (grid, robot)
