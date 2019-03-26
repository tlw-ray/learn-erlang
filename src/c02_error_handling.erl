%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/robustness.html#error-handling
%%% @end
%%% Created : 26. 三月 2019 22:00
%%%-------------------------------------------------------------------
-module(c02_error_handling).
-author("hdp").

%% API
-export([start/1,  ping/2, pong/0]).

ping(N, Pong_Pid) ->
  link(Pong_Pid),
  ping1(N, Pong_Pid).

ping1(0, _) ->
  exit(ping);

ping1(N, Pong_Pid) ->
  Pong_Pid ! {ping, self()},
  receive
    pong ->
      io:format("Ping received pong~n", [])
  end,
  ping1(N - 1, Pong_Pid).

pong() ->
  receive
    {ping, Ping_PID} ->
      io:format("Pong received ping~n", []),
      Ping_PID ! pong,
      pong()
  end.

start(Ping_Node) ->
  PongPID = spawn(c02_error_handling, pong, []),
  spawn(Ping_Node, c02_error_handling, ping, [3, PongPID]).
