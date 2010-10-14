#SLIDE

<image src="http://erlang.org/images/erlang-logo.png" alt="Erlang"></image>
 
## do geeks dream of concurrent sheeps?

<small>Luca Greco &lt;luca.greco@alcacoop.it&gt;</small>

# LinuxDay2010

#SLIDE

## Erlang...

* created at ericsson for its telco devices
* designed for concurrent / fault tolerant software

#SLIDE

## And now...

* ejabberd, couchdb, rabbitmq...
* github, basho, processone, facebook, google, amazon...

#SLIDE

# Ok... wait... but...

## Why should I learn erlang?!?!

#SLIDE

## Reason 1.

You can look at this page for a while...

## YOU WANT 

TODO: Immagine/animazione psichedelica

## TO LEARN ERLANG

#SLIDE

## Reason 2.

You are already using some erlang software:

* EJabberd
* RabbitMQ
* CouchDB
* Riak
* ...

#SLIDE 

## Reason 3.

You are interested to learn

## how to handle concurrency

from an erlang point of view

#SLIDE

# From Erlang...
## WTF?!??!
# To Erlang...
## FTW!!!!

<small>(<a href="http://www.erlang-factory.com/upload/presentations/219/ErlangFactorySFBay2010-JackMoffitt.pdf">
         from Jack Moffit presentation - ErlangFactorySFBay2010)</a></small>

#SLIDE

#  Episode. 0x01

## "The Concurrent Dream"

![concurrent sheeps](images/concurrent_sheeps.png)

#SLIDE

## Think "Concurrent" can be tricky...

![headache](images/headache.jpg)
<div style="font-size: 0.5em;">(image from <a href="http://www.flickr.com/photos/87913776@N00/871983779/in/photostream/">futureatlas.com)</a></div>

#SLIDE

And if...

## SHARED MUTABLE MEMORY IS EVIL...

l![Shared State](images/shared_state.png)

#SLIDE

Then...

## THREADING + OOP IS THE HELL

![Thread OOP](images/thread_oop.png)

#SLIDE

Ok... admit it!!!

## WE DON'T KNOW
 
## HOW CONCURRENT 

## OUR THREADED OOP APPLICATION

## WILL BE

#SLIDE

## ...How to survive?

* don't share memory
* message passing
* lightweight processes

#SLIDE

#  Episode. 0x01
## "The Faultless Lie"

![Bug Free](images/bug_free.png)

#SLIDE

## FAULT LESS IS A LIE

* bugs and fault conditions are the only truth

#SLIDE

## FAULT TOLERANT SYSTEMS PRINCIPLES:

* fail fast
* if it fail, do something simpler
* separate faults recovery from application code
* isolate faults in its process

#SLIDE

#  Episode. 0x02
## "My name is ERL"

![my name is erl](images/my_name_is_erl.png)

#SLIDE

## My Name is ERL

Your Erlang best friend: *interactive shell*

<pre>
$ erl -sname rpl
Erlang R13B03 (erts-5.7.4) [source] [smp:2:2] [rq:2] [async-threads:0]...
Eshell V5.7.4  (abort with ^G)
(rpl@sheldon)1&gt;
</pre>

#SLIDE

## Erlang Basic Concepts

#SLIDE

* Code is organized into **modules**
* Module name have to match filename
* Modules are compiled into **bytecode** 
 (*mycode.erl* -> *mycode.beam*)
* Compiled modules are loaded by
  an **Erlang VM**
#SLIDE

## MODULE: helloworld.erl

<pre>
-module(helloworld).
-export([run/0]).

run() ->
  io:format("Hello world!\n").
</pre>

#SLIDE

## BACK TO ERL: compile and run

<pre>
$ erl
Erlang R13B03 (erts-5.7.4) [source] [smp:2:2] [rq:2] [async-threads:0] [hipe] ...

Eshell V5.7.4  (abort with ^G)
1> c(helloworld).
{ok,helloworld}
2> helloworld:run().
Hello world!
ok
3> 
</pre>

#SLIDE

## single assignment vars

![bad match](images/bad_match.png)

#SLIDE

## pattern matching

![pattern matching](images/pattern_matching.png)

#SLIDE

## Lightweight processes

![spawn Fun](images/spawn_fun.png)

#SLIDE

## Message passing

![send/receive message](images/send_receive_message.png)

#SLIDE

## spawn and receive

<pre>
Fun = fun () ->
  receive 
    message -> io:format("received~n")
  after 2000 ->
    io:format("timeout~n")
  end
end,
Pid = spawn(Fun),
Pid ! message.
    
</pre>

#SLIDE

## receive loop

TODO

#SLIDE

## OTP

<pre>
TODO
</pre>