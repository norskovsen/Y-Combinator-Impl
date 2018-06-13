import Unsafe.Coerce

y = \ f -> (\ x -> f(unsafeCoerce x x) )(\x -> f(unsafeCoerce x x))

facImprover = \ partial -> \ n -> if n == 1 then 1 else n * partial(n-1)
fibImprover = \ partial -> \ n -> if n < 2 then 1 else partial(n-1) + partial(n-2)

fac = y facImprover
fib = y fibImprover

num = 1

main = do print(fac num)
          print(fib num)


