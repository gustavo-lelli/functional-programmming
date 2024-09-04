{-# LANGUAGE OverloadedStrings #-}

import System.IO
import Data.List (sort, sortBy, take)
import Data.Function (on)

-- Definição de país seguindo o CSV
data Country = Country
    { countryName :: String
    , confirmed :: Int
    , deaths :: Int
    , recovery :: Int
    , active :: Int
    } deriving (Show)

-- Parsear um linha do CSV em um país
parseCountry :: String -> Maybe Country
parseCountry line =
    case splitOn ',' line of
        [name, confirmedStr, deathsStr, recoveryStr, activeStr] ->
            Just $ Country name (readInt confirmedStr) (readInt deathsStr) (readInt recoveryStr) (readInt activeStr)
        _ -> Nothing
    where
        readInt :: String -> Int
        readInt = read

splitOn :: Char -> String -> [String]
splitOn delimiter = foldr f [[]]
    where
        f c l@(x:xs)
            | c == delimiter = [] : l
            | otherwise = (c : x) : xs

-- Ler o CSV e parsear numa lista de países
readCSV :: FilePath -> IO (Maybe [Country])
readCSV filePath = do
    content <- readFile filePath
    let csvLines = lines content -- Drop the header line
    let parsedCountries = traverse parseCountry csvLines
    case parsedCountries of
        Just countries -> return $ Just countries
        Nothing -> do
            putStrLn $ "Failed to parse countries from CSV file: " ++ filePath
            print csvLines
            return Nothing

main :: IO ()
main = do
    input <- getLine

    let maybeValues = map readMaybe (words input) :: [Maybe Int]
    case sequence maybeValues of
        Just [n1, n2, n3, n4] -> do
            -- Ler CSV
            let filePath = "dados.csv"
            maybeCountries <- readCSV filePath
            case maybeCountries of
                Just countries -> do
                    let -- 1) A soma de "Active" de todos os países em que "Confirmed" é maior o igual que n1.
                        sumActiveN1 = sum $ map active $ filter (\c -> confirmed c >= n1) countries

                        -- 2) Dentre os n2 países com maiores valores de "Active", a soma das "Deaths" dos n3 países com menores valores de "Confirmed".
                        sortedByActive = sortBy (flip (compare `on` active)) countries
                        topNActive = take n2 sortedByActive
                        bottomNConfirmed = take n3 $ sortBy (compare `on` confirmed) topNActive
                        sumDeathsN3 = sum $ map deaths bottomNConfirmed

                        -- 3) Os n4 países com os maiores valores de "Confirmed". Os nomes devem estar em ordem alfabética.
                        sortedByConfirmed = sortBy (flip (compare `on` confirmed)) countries
                        topNConfirmed = take n4 sortedByConfirmed
                        sortedByName = sort $ map countryName topNConfirmed

                    putStrLn $ show sumActiveN1
                    putStrLn $ show sumDeathsN3
                    mapM_ putStrLn sortedByName
                Nothing -> putStrLn $ "Formato do csv inválido"
        _ -> putStrLn "Input inválido"

-- Ler inteiro em segurança
readMaybe :: String -> Maybe Int
readMaybe s = case reads s of
    [(x, "")] -> Just x
    _ -> Nothing
