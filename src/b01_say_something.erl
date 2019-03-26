%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/conc_prog.html#processes
%%% @end
%%% Created : 24. 三月 2019 11:35
%%%-------------------------------------------------------------------
-module(b01_say_something).
-author("hdp").

%% API
-export([start/0, say_something/2]).

say_something(_, 0) ->
  done;
say_something(What, Times) ->
  io:format("~p~n", [What]),
  say_something(What, Times - 1).

start() ->
  spawn(b01_say_something, say_something, [hello, 3]),
  spawn(b01_say_something, say_something, [goodbye, 3]).
