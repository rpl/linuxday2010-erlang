-module(kv_srv).

-behaviour(gen_server).

%% API
-export([start_link/0, get/1, set/2, stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, terminate/2]).

-record(state, {store}).

-define(SERVER, ?MODULE).

%% API

start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

get(Key) ->
    gen_server:call(?SERVER, {get, Key}). 

set(Key, Value) ->
    gen_server:call(?SERVER, {set, Key, Value}).

stop() ->
    gen_server:call(?SERVER, stop).

%% gen_server callbacks

init([]) ->
    Store = dict:new(),
    {ok, #state{store=Store}}.

handle_call(stop, _From, State) ->
    {stop, normal, ok, State};
handle_call({set, Key, Value}, _From, State) ->
    NewDict = dict:store(Key, Value, State#state.store),
    NewState = State#state{store=NewDict}, 
    {reply, ok, NewState};
handle_call({get, Key}, _From, State) ->
    Reply = case dict:find(Key, State#state.store) of
		error -> {error, unknown_key};
		{ok, Value} -> {ok, Value}
	    end,
    {reply, Reply, State}.

terminate(_Reason, _State) ->
    ok.



    
