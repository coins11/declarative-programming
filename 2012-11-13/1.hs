listsum :: Num a => [a] -> a
listsum = foldl (+) 0
