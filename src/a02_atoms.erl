%% http://erlang.org/doc/getting_started/seq_prog.html#atoms
-module(a02_atoms).
-export([convert/2]).

convert(M, inch) ->
	M / 2.54;

convert(N, centimeter) ->
	N * 2.54.
