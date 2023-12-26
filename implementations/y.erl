-module(y).
-export([main/0]).

%% @doc Y combinator implementation in Erlang.
%% To run this implementation, use the following command:
%%   erl -noshell -s y main -s init stop
%% @end

main() -> 
  Y = fun (F) ->
    (fun (X) -> 
      X(X) end)(fun (X) -> 
        F(fun (T) -> (X(X))(T) end) 
      end) 
    end,
  
  FacImprover = 
    fun(Partial) -> 
      fun 
          (N) when N < 2 -> 1; 
          (N) when N >= 2 -> N * Partial(N - 1) 
      end 
  end,

  FibImprover = 
    fun(Partial) -> 
      fun 
          (N) when N < 2 -> 1; 
          (N) when N >= 2 -> Partial(N - 2) + Partial(N - 1)
      end 
  end,

  Fac = Y(FacImprover),

  Fib = Y(FibImprover),

  io:format("Fac 0: ~p~n", [Fac(0)]),
  io:format("Fac 1: ~p~n", [Fac(1)]),
  io:format("Fac 2: ~p~n", [Fac(2)]),
  io:format("Fac 3: ~p~n", [Fac(3)]),
  io:format("Fac 4: ~p~n", [Fac(4)]),
  io:format("Fac 5: ~p~n", [Fac(5)]),

  io:format("Fib 0: ~p~n", [Fib(0)]),
  io:format("Fib 1: ~p~n", [Fib(1)]),
  io:format("Fib 2: ~p~n", [Fib(2)]),
  io:format("Fib 3: ~p~n", [Fib(3)]),
  io:format("Fib 4: ~p~n", [Fib(4)]),
  io:format("Fib 5: ~p~n", [Fib(5)]).

