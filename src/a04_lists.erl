%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/seq_prog.html#lists
%%% @end
%%% Created : 24. 三月 2019 8:15
%%%-------------------------------------------------------------------
-module(a04_lists).
-author("hdp").

%% API
-export([list_length/1]).

list_length([]) ->
  0;
list_length([_ | Rest]) ->
  1 + list_length(Rest).

