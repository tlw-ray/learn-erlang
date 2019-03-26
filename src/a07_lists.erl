%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/seq_prog.html#more-about-lists
%%% @end
%%% Created : 24. 三月 2019 8:56
%%%-------------------------------------------------------------------
-module(a07_lists).
-author("hdp").

%% API
-export([reverse/1]).

reverse(List) ->
  reverse(List, []).

reverse([Head | Rest], Reversed_List) ->
  reverse(Rest, [Head | Reversed_List]);
reverse([], Reversed_List) ->
  Reversed_List.
