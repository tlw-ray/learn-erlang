%% http://erlang.org/doc/getting_started/seq_prog.html#tuples
-module(a03_tuples).
-export([convert_length/1]).

convert_length({centimeter, X}) ->
  {inch, X / 2.54};
convert_length({inch, Y}) ->
  {centimeter, Y * 2.54}.
