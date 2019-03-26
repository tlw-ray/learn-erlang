%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/conc_prog.html#registered-process-names
%%% @end
%%% Created : 26. 三月 2019 21:44
%%%-------------------------------------------------------------------
-module(b03_register).
-author("hdp").

%% API
-export([start/0, ping/1, pong/0]).

ping(0) ->
  pong ! finished,
  io:format("ping finished~n", []);

ping(N) ->
  pong ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong~n", [])
  end,
  ping(N - 1).

pong() ->
  receive
    finished ->
      io:format("Pong finished~n", []);
    {ping, Ping_PID} ->
      io:format("Pong received ping~n", []),
      Ping_PID ! pong,
      pong()
  end.

start() ->
  register(pong, spawn(b03_register, pong, [])),
  spawn(b03_register, ping, [3]).
