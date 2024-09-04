maxCrescent :: [Integer] -> Int -> Int -> Int
maxCrescent [] _ maxSoFar = maxSoFar
maxCrescent [_] curr_max maxSoFar = max curr_max maxSoFar
maxCrescent (head:current:tail) curr_max maxSoFar
    | head < current = maxCrescent (current:tail) (curr_max + 1) (max maxSoFar (curr_max + 1))
    | otherwise = maxCrescent (current:tail) 1 (max maxSoFar curr_max)
    
-- function to initialize the recursion
longestIncreasingSubsequence :: [Integer] -> Int
longestIncreasingSubsequence [] = 0
longestIncreasingSubsequence [_] = 1
longestIncreasingSubsequence (x:xs) = maxCrescent (x:xs) 1 1

-- Function to parse a single integer from a string
parseInt :: String -> Maybe Integer
parseInt str = case reads str of
    [(num, "")] -> Just num
    _           -> Nothing

-- Function to read a list of integers from a string
readIntList :: String -> [Integer]
readIntList input = case words input of
    []   -> []
    ws   -> let parsed = map parseInt ws
            in [x | Just x <- parsed]

main :: IO ()
main = do
    input <- getLine
    let numbers = readIntList input
    putStrLn $ show (longestIncreasingSubsequence numbers)