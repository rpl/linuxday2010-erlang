-module(helloloop).

-compile(export_all).

loop() ->
    receive
        message -> io:format("message received~n"), 
                   loop();
        stop -> io:format("exiting~n")
    after 
        2000 -> io:format("timeout~n"),
                loop()
    end.

start() ->
    spawn(?MODULE, loop, []).
