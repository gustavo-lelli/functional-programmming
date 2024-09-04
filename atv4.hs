import Data.List (intercalate)

-- Função para formatar a saída
formatarSaida :: [Int] -> String
formatarSaida pinosDerrubados = intercalate " | " (map formatarFrame frames) ++ " | " ++ show (calcularPontuacao pinosDerrubados)
    where
        frames = splitFrames pinosDerrubados

-- Função para dividir a lista de pinos em frames
splitFrames :: [Int] -> [[Int]]
splitFrames = go 1
    where
        go _ [] = []
        go 10 (x:y:z:[]) = [[x, y, z]]
        go 10 (x:y:[]) = [[x, y]]
        go 10 (x:[]) = [[x]]
        go frame (10:xs) = [10] : go (frame + 1) xs
        go frame (x:y:xs) = [x, y] : go (frame + 1) xs
        go frame (x:xs) = [[x]]

-- Função para formatar um frame
formatarFrame :: [Int] -> String
formatarFrame [10] = "X _"
formatarFrame [x, y]
    | x + y == 10 = show x ++ " /"
    | otherwise = show x ++ " " ++ show y
formatarFrame [x, y, z]
    | x == 10 && y + z == 10 = "X " ++ bonusY y ++ " /"
    | x == 10 = "X " ++ bonusY y ++ " " ++ bonusY z
    | x + y == 10 = show x ++ " / " ++ bonusY z
    | otherwise = show x ++ " " ++ show y ++ " " ++ show z
    where
        bonusY n
            | n == 10 = "X"
            | otherwise = show n
formatarFrame _ = ""

-- Função para calcular a pontuação total
calcularPontuacao :: [Int] -> Int
calcularPontuacao pinosDerrubados = sum $ go 1 pinosDerrubados
    where
        go _ [] = []
        go 10 (x:y:z:[]) = [x + y + z]
        go 10 (x:y:[]) = [x + y]
        go 10 (x:[]) = [x]
        go frame (10:xs) = (10 + sum (take 2 xs)) : go (frame + 1) xs
        go frame (x:y:xs)
            | x + y == 10 = (10 + head xs) : go (frame + 1) xs
            | otherwise = (x + y) : go (frame + 1) xs
        go frame (x:xs) = [x] ++ go frame xs

-- Função principal para leitura da entrada e exibição da saída
main :: IO ()
main = do
    input <- getLine
    let pinosDerrubados = map read (words input) :: [Int]
    putStrLn $ formatarSaida pinosDerrubados