-module(hellofault).

-compile(export_all).

loop() ->
    receive
        message -> io:format("message received~n"), 
                   loop();
        stop -> nonexistent:bug()
    end.

start() ->
    spawn(?MODULE, loop, []).
