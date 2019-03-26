%%%-------------------------------------------------------------------
%%% @author hdp
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 24. 三月 2019 10:49
%%%-------------------------------------------------------------------
-module(a10_case).
-author("hdp").

%% API
-export([convert_length/1]).

convert_length(Length) ->
  case Length of
    {centimeter, X} ->
      {inch, X / 2.54};
    {inch, Y} ->
      {centimeter, Y * 2.54}
  end.
