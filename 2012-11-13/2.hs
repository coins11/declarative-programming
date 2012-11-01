-- 1
pyth :: Num a => (a, a, a) -> Bool
pyth (x, y, z) =
    let x' = x*x
        y' = y*y
        z' = z*z in
    x' == y'+z' || y' == x'+z' || z' == x'+y'

-- 2
triads :: (Num a, Enum a) => a -> [(a, a, a)]
triads n = filter pyth [(x, y, z) | x <- [0..n], y <- [0..n], z <- [0..n]]
