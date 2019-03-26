%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/conc_prog.html#distributed-programming
%%% @end
%%% Created : 26. 三月 2019 21:50
%%%-------------------------------------------------------------------
-module(b04_distributed).
-author("hdp").

%% API
-export([start_ping/1, start_pong/0,  ping/2, pong/0]).

ping(0, Pong_Node) ->
  {pong, Pong_Node} ! finished,
  io:format("ping finished~n", []);

ping(N, Pong_Node) ->
  {pong, Pong_Node} ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong~n", [])
  end,
  ping(N - 1, Pong_Node).

pong() ->
  receive
    finished ->
      io:format("Pong finished~n", []);
    {ping, Ping_PID} ->
      io:format("Pong received ping~n", []),
      Ping_PID ! pong,
      pong()
  end.

start_pong() ->
  register(pong, spawn(b04_distributed, pong, [])).

start_ping(Pong_Node) ->
  spawn(b04_distributed, ping, [3, Pong_Node]).
