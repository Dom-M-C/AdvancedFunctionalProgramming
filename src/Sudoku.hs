module Sudoku where

import Data.List

type Grid = Matrix Value
type Matrix a = [Row a]
type Row a = [a]
type Value = Char

boxsize :: Int
boxsize = 3

values :: [Value]
values =  ['1'..'9']

empty :: Value -> Bool
empty =  (== '.')

single :: [a] -> Bool
single [_] =  True
single _ =  False

easy :: Grid
easy = 
    [   "2....1.38"
    ,   "........5"
    ,   ".7...6..."
    ,   ".......13"
    ,   ".981..257"
    ,   "31....8.."
    ,   "9..8...2."
    ,   ".5..69784"
    ,   "4..25...."
    ]

blank :: Grid
blank = replicate n $ replicate n '.'
    where n = boxsize ^ 2

rows :: Matrix a -> [Row a]
rows = id
-- id = rows . rows

cols :: Matrix a -> [Row a]
cols = transpose
-- id = cols . cols

boxes :: Matrix a -> [Row a]
boxes = unpack . map cols . pack
    where
       pack   = split . map split
       split  = chop boxsize
       unpack = map concat . concat
-- id = boxes . boxes

chop      :: Int -> [a] -> [[a]]
chop _ [] =  []
chop n xs =  take n xs : chop n (drop n xs)

valid :: Grid -> Bool
valid g = 
    all nodupes (rows g) &&
    all nodupes (cols g) &&
    all nodupes (boxes g)

nodupes :: [Value] -> Bool
nodupes [] = True
nodupes (x:xs) = x `notElem` xs && nodupes xs
