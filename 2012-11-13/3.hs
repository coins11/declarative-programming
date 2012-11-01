-- 1
suml :: Num a => [a] -> [a] -> [a]
suml l1 l2 = zipWith (+) l1 l2

-- 2
fiblist = 1 : 1 : suml fiblist (tail fiblist)
