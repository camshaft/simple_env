-module(simple_env).

-export([get/1]).
-export([get/2]).
-export([get_binary/1]).
-export([get_binary/2]).
-export([get_integer/1]).
-export([get_integer/2]).

get(Name)->
  ?MODULE:get(Name, undefined).

get(Name, Default)->
  case os:getenv(Name) of
    false -> Default;
    Value -> Value
  end.

get_binary(Name)->
  ?MODULE:get_binary(Name, undefined).

get_binary(Name, Default)->
  case ?MODULE:get(Name) of
    undefined -> Default;
    Value -> list_to_binary(Value)
  end.

get_integer(Name)->
  ?MODULE:get_integer(Name, undefined).

get_integer(Name, Default)->
  case ?MODULE:get(Name) of
    undefined -> Default;
    Value -> list_to_integer(Value)
  end.
