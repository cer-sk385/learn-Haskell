module Main (main) where

  -- Haskell 1日目

-- IO型の関数
main :: IO ()

-- do記法を使うと、手続き型パラダイムのような書き方が可能
main = do
  -- putStrLnは文字列を表示する関数
  putStrLn "Hello Haskell!"

  -- 変数の宣言
  let x :: Int
      x = 12
  let y :: Int
      y = 23
  let z :: Int
  
      z = x * y

  print z

  -- Haskell 2日目

  -- 関数の宣言
  let square :: Int -> Int
      -- オフサイドルールがあり、インデントも構文の一部である。
      square k = k * k
  print (square 13)

  -- 引数を２つとる関数（内部的には高階関数であり、カリー化により抽象されている）
  let add :: Int -> Int -> Int
      add a b = a + b

  print (add 434 871)

  -- 階乗を計算する再帰関数
  let factorial :: Int -> Int
      factorial 0 = 1 -- 0を受け取ったら1を返す
      factorial n = n * factorial (n - 1) -- それ以外の場合はn * (n-1)の階乗を返す

  print (factorial 4)