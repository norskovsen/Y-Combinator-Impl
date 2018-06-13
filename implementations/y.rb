# The Y Combinator in Ruby using Procs
Y = -> (improver){->(f){f.(f)}.(->(f){improver.(->(x){f.(f).(x)})})}

fibPartial = -> (partial){->(n) {(n == 1)? 1 : n*partial.(n-1)}}
facPartial = -> (partial){->(n) {(n < 2) ? 1 : partial.(n-1)+partial.(n-2)}}

fib = Y.(fibPartial)
fac = Y.(facPartial)
