%% http://erlang.org/doc/getting_started/seq_prog.html#modules-and-functions
-module(a01_hello).
-export([double/1]).

double(X) ->
	2 * X.
