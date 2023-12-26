"""
Y combinator implementation in Elixir.

To run this implementation, you need to have Elixir installed.
Then, to use it start the interactive shell with:

  $ iex

And then load the file with:

    iex> import_file("implementations/y.exs")
    iex> fac.(5)
"""

y = fn f ->
  (fn x ->
     x.(x)
   end).(fn x ->
    f.(fn t ->
      x.(x).(t)
    end)
  end)
end

fac_improver = fn partial ->
  fn
    1 -> 1
    n -> n * partial.(n - 1)
  end
end

fib_improver = fn partial ->
  fn
    0 -> 1
    1 -> 1
    n -> partial.(n - 1) + partial.(n - 2)
  end
end

fac = y.(fac_improver)
fib = y.(fib_improver)
