%%%-------------------------------------------------------------------
%% @doc supversior_testing public API
%% @end
%%%-------------------------------------------------------------------

-module(supversior_testing_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    supversior_testing_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
