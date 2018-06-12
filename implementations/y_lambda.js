/* Y-combinator - Javascript lambda version */ 
y = (improver) =>
    ((f) => (f(f)))((f) => improver((x) => f(f)(x)));

fac_improver = (partial) => (n) => (n == 0) ? 1 : n * partial(n-1);
fib_improver = (partial) => (n) => (n < 2) ? 1 : partial(n-1) + partial(n-2);

fac = y(fac_improver);
fib = y(fib_improver);

fib(20);

