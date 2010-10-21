-module(hellostateloop).

-compile(export_all).

loop(State) ->
    receive
        {Pid, get, Key} -> 
	    Reply = case dict:find(Key, State) of
			error -> {error, unknown_key};
			{ok, Value} -> {ok, Value}
		    end,
	    Pid ! {reply, Reply},
	    loop(State);
        {Pid, set, Key, Value} -> 	
	    NewState = dict:store(Key, Value, State),
	    Pid ! {reply, ok},
	    loop(NewState);
        stop -> io:format("exiting~n")
    end.

start() ->
    State = dict:new(),
    Pid = spawn(?MODULE, loop, [State]),
    {ok, Pid}.

get(Pid, Key) ->
    Pid ! {self(), get, Key},
    receive
	{reply, Reply} -> Reply
    after
	2000 -> {error, timeout}
    end.

set(Pid, Key, Value) ->
    Pid ! {self(), set, Key, Value},
    receive
	{reply, Reply} -> Reply
    after
	2000 -> {error, timeout}
    end.
			      
	     
				    
