  -- Haskell 5日目
  -- ghciで対話的に関数を実行してみる。

-- 関数の宣言（do記法でないので、let不要）

-- Intは固定長
-- Integerは任意精度整数

square :: Integer -> Integer
square k = k * k

-- 引数を２つとる関数
add :: Integer -> Integer -> Integer
add a b = a + b

-- 階乗を計算する再帰関数
factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

-- 総和を計算する再帰関数
sumTest :: Integer -> Integer
sumTest 0 = 0
sumTest n = n + sumTest (n-1)

-- フィボナッチ数列を再帰関数で実装
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci(n-1) + fibonacci(n-2)

-- 効率的なフィボナッチ数列の実装
fibonacciEff :: Integer -> Integer
fibonacciEff num = fib' num 0 1
  where
    fib' 0 a _ = a
    fib' 1 _ b = b
    fib' m a b = fib' (m-1) b (a+b)

-- リストの操作
doubleList :: [Integer] -> [Integer]
doubleList [] = []
doubleList (x:xs) = 2*x : doubleList xs

