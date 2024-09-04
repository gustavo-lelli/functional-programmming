import Data.List

isPrime :: Int -> Bool
isPrime n | n <= 2 = n == 2
          | otherwise = null [x | x <- [2..isqrt n], n `mod` x == 0]
    where isqrt = floor . sqrt . fromIntegral

primeGap :: Int -> Int -> Int
primeGap x y = if null gaps then 0 else maximum gaps
    where primes = filter isPrime [x..y]
          gaps = zipWith (-) (tail primes) primes

main :: IO ()
main = do
    x <- readLn
    y <- readLn
    print $ primeGap x y