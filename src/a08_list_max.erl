%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%% http://erlang.org/doc/getting_started/seq_prog.html#matching,-guards,-and-scope-of-variables
%%% @end
%%% Created : 24. 三月 2019 10:20
%%%-------------------------------------------------------------------
-module(a08_list_max).
-author("hdp").

%% API
-export([list_max/1]).

list_max([Head|Rest]) ->
  list_max(Rest, Head).

list_max([], Res) ->
  Res;
list_max([Head|Rest], Result_so_far) when Head > Result_so_far ->
  list_max(Rest, Head);
list_max([_|Rest], Result_so_far)  ->
  list_max(Rest, Result_so_far).
