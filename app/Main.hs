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
      factorial 0 = 1 -- 0を受け取ったら1を返す（基底ケース）
      factorial n = n * factorial (n - 1) -- それ以外の場合はn * (n-1)の階乗を返す

  print (factorial 4)

  -- 総和を計算する再帰関数
  let sumTest :: Int -> Int
      sumTest 0 = 0 --（基底ケース）
      sumTest n = n + sumTest (n-1)
  print (sumTest 234)

  -- フィボナッチ数列を再帰関数で実装してみる
  let fibonacci :: Int -> Int
      fibonacci 0 = 0
      fibonacci 1 = 1
      fibonacci n = fibonacci(n-1) + fibonacci(n-2)
  print (fibonacci 7)
  -- print (fibonacci 2239) 計算量が指数関数的に増加してしまって終わらない

--   fibonacci 5
-- = fibonacci 4 + fibonacci 3
-- = (fibonacci 3 + fibonacci 2) + (fibonacci 2 + fibonacci 1)
-- = ((fibonacci 2 + fibonacci 1) + (fibonacci 1 + fibonacci 0)) + ((fibonacci 1 + fibonacci 0) + 1)

  -- 効率的なフィボナッチ数列の実装（理解するだけ）
  let fibonacciEff :: Int -> Int
      -- 補助関数を使って、前の2つの数（a, b）を保持しながら計算
      fibonacciEff num = fib' num 0 1
        where
          fib' 0 a _ = a          -- 0の場合はaを返す（_ は使わないので、命名を省略するということを表す　-> 第三引数を無視）
          fib' 1 _ b = b          -- 1の場合はbを返す（第二引数を無視）
          fib' m a b = fib' (m-1) b (a+b)  -- それ以外の場合は、次の2数を計算

  -- fibonacciEff 4 = fib' 4 0 1
  --                ↓
  --   fib' 4 0 1 = fib' (4-1) 1 (0+1)     -- fib' 3 1 1
  --   fib' 3 1 1 = fib' (3-1) 1 (1+1)     -- fib' 2 1 2
  --   fib' 2 1 2 = fib' (2-1) 2 (1+2)     -- fib' 1 2 3
  --   fib' 1 2 3 = 3                       -- 基底ケース fib' 1 _ b = b が適用

  -- 結果: 3　、つまりフィボナッチ数列の4番目の値（0,1,1,2,3）

  print (fibonacciEff 2239)  -- これなら高速