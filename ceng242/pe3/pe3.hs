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
isInGrid grid coor = if (0 <= (snd coor)) && (snd coor < (length grid)) && (0 <= (fst coor)) && ((fst coor) < (length(grid!!0)))
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
quicksort :: Ord a => [a] -> [a]
quicksort []     = []
quicksort (p:xs) = (quicksort lesser) ++ [p] ++ (quicksort greater)
    where
        lesser  = filter (< p) xs
        greater = filter (>= p) xs

isPit :: Cell -> Bool
isPit Pit = True
isPit _ = False

pitsHor :: [Cell] -> [Bool]
pitsHor inpLine = map isPit inpLine

pits :: [[Cell]] -> [[Bool]]
pits inpGrid = map pitsHor inpGrid


findAllInRow list val = [x | x <- [0..(length list - 1)], list!!x == val]

findAll [] val = []
findAll grid val = [findAllInRow (head grid) val] ++ findAll (tail grid) val

coPit grid val = [(x, y) | y <- [0..(length (findAll grid val) - 1)], x <- (findAll grid val)!!y]
  
  
coordinatesOfPits :: Grid -> [Coordinate]
coordinatesOfPits grid = quicksort (coPit (pits grid) True)

-------------------------------------------------------------------------------------------

lowerEnergy inpRobot amount = inpRobot { energy = newEnergy } where newEnergy = (energy inpRobot) - amount
increaseStorage inpRobot amount = inpRobot { storage = newStorage } where newStorage = (storage inpRobot) + amount
changeLocation inpRobot amount = inpRobot { location = (newX, newY) } 
    where newX = (fst (location inpRobot) + fst amount)
          newY = (snd (location inpRobot) + snd amount)

          --North | East | South | West | PickUp | PutDown
          --   1     1       1      1       5         3      
traceMove grid robot move
    | move == North   = if not (isPit ((grid!!(snd (location robot)))!!(fst(location robot)))) && (snd (location robot) /= 0) && (energy robot) >= 1
                           then let newEnergy = ((energy robot) - 1)
                                    newLocation = (fst (location robot), snd (location robot) - 1)
                                in robot { energy = newEnergy, location = newLocation }
                           else let newEnergy = cull ((energy robot)-1)
                                in robot { energy = newEnergy } 
    | move == South   = if not (isPit ((grid!!(snd (location robot)))!!(fst(location robot)))) && (snd (location robot) /= (length grid - 1)) && (energy robot) >= 1
                           then let newEnergy = ((energy robot) - 1)
                                    newLocation = (fst (location robot), snd (location robot) + 1)
                                in robot { energy = newEnergy, location = newLocation }
                           else let newEnergy = cull ((energy robot)-1)
                                in robot { energy = newEnergy } 
    | move == East    = if not (isPit ((grid!!(snd (location robot)))!!(fst(location robot)))) && (fst (location robot) /= (length (grid!!0) - 1)) && (energy robot) >= 1
                           then let newEnergy = ((energy robot) - 1)
                                    newLocation = (fst (location robot) + 1, snd (location robot))
                                in robot { energy = newEnergy, location = newLocation }
                           else let newEnergy = cull ((energy robot)-1)
                                in robot { energy = newEnergy } 
    | move == West    = if not (isPit ((grid!!(snd (location robot)))!!(fst(location robot)))) && (fst (location robot) /= 0) && (energy robot) >= 1
                           then let newEnergy = ((energy robot) - 1)
                                    newLocation = (fst (location robot) - 1, snd (location robot))
                                in robot { energy = newEnergy, location = newLocation }
                           else let newEnergy = cull ((energy robot)-1)
                                in robot { energy = newEnergy } 
    | move == PickUp  = if (energy robot >= 5)
                           then let newEnergy = ((energy robot) - 5)
                                in robot { energy = newEnergy }
                           else robot { energy = 0 }
    | move == PutDown = if (energy robot >= 3)
                           then let newEnergy = ((energy robot) - 3)
                                in robot { energy = newEnergy }
                           else robot { energy = 0 }
    | otherwise       = robot
    

tracePath :: Grid -> Robot -> [Move] -> [Coordinate]
tracePath grid robot moves = []

------------------------------------- PART II ----------------------------------------------

cull a 
    | a > 100 = 100
    | a < 0 = 0
    | otherwise = a

isSC :: Cell -> Bool
isSC (SpaceCraft _) = True
isSC _ = False

scHor inpLine = map isSC inpLine

scs inpGrid = map scHor inpGrid

increaseEnergy scLocation robot = robot { energy = newEnergy } where newEnergy = cull ((energy robot) + max 0 (100-((abs ((fst (location robot)) - (fst scLocation)) + abs ((snd (location robot)) - (snd scLocation))) * 20)))
      


energiseRobots :: Grid -> [Robot] -> [Robot]
energiseRobots grid robots = map (increaseEnergy ((coPit (scs grid) True)!!0)) robots

-------------------------------------------------------------------------------------------

applyMoves :: Grid -> Robot -> [Move] -> (Grid, Robot)
applyMoves grid robot moves = (grid, robot)
