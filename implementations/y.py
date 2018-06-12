"""
 Y-Combinator function in python using standard functions
"""
Y = lambda improver: (lambda f: f(f))(lambda f: improver(lambda x: f(f)(x)))

fac_improve = lambda partial: lambda n: 1 if n == 1 else n*partial(n-1)
fib_improve = lambda partial: lambda n: 1 if n < 2 else partial(n-1) + partial(n-2)

fac = Y(fac_improve)
fib = Y(fib_improve)
