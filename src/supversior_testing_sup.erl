%%%-------------------------------------------------------------------
%% @doc supversior_testing top level supervisor.
%% @end
%%%-------------------------------------------------------------------

-module(supversior_testing_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%====================================================================
%% API functions
%%====================================================================

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

%%====================================================================
%% Supervisor callbacks
%%====================================================================

%% Child :: #{id => Id, start => {M, F, A}}
%% Optional keys are restart, shutdown, type, modules.
%% Before OTP 18 tuples must be used to specify a child. e.g.
%% Child :: {Id,StartFunc,Restart,Shutdown,Type,Modules}
init([]) ->
    {ok, { {one_for_all, 0, 1}, child_specs()} }.

%%====================================================================
%% Internal functions
%%====================================================================

child_specs() ->
    [
        worker_child_spec(main),
        worker_child_spec(bad),
        supervisor_child_spec(child_sup)
    ].

worker_child_spec(Id) ->
    #{id => Id, start => {Id,start_link,[]}, type => worker}.

supervisor_child_spec(Module) ->
    Id = Module,
    #{id => Id, start => {Module,start_link,[[]]}, type => supervisor}.
