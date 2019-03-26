%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/conc_prog.html#message-passing
%%% @end
%%% Created : 24. 三月 2019 11:41
%%%-------------------------------------------------------------------
-module(b02_message_passing).
-author("hdp").

%% API
-export([start/0, ping/2, pong/0]).

ping(0, Pong_PID) ->
  Pong_PID ! finished,
  io:format("ping finished~n", []);

ping(N, Pong_PID) ->
  Pong_PID ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong~n", [])
  end,
  ping(N - 1, Pong_PID).

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
  Pong_PID = spawn(b02_message_passing, pong, []),
  spawn(b02_message_passing, ping, [3, Pong_PID]).
