-- 1
pyth :: (Num a, Eq a) => (a, a, a) -> Bool
pyth (x, y, z) =
    let x' = x*x
        y' = y*y
        z' = z*z in
    (x' == y'+z' || y' == x'+z' || z' == x'+y') && x /= 0 && y /= 0 && z /= 0

-- 2
triads :: (Num a, Enum a, Eq a) => a -> [(a, a, a)]
triads n = filter pyth [(x, y, z) | x <- [0..n], y <- [x..n], z <- [y..n]]
