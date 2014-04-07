ndaRepl
=========

*Plug-n-Play lightweight http server that interprets ObjC code in the app environment*


About
-----

KindaRepl is a library that is linked to any application in order to allow one to interpret ObjC code in the app environment without code recompiling. For interpreting code KindaRepl uses Tosty_.

.. _Tosty: https://github.com/leonardvandriel/Tosti

Getting Started
---------------

Usage is pretty simple. One has to add a KindaRepl library to a project (or a workspace, whatever), and put somewhere in the code::

    [KindaRepl start];

It is just a mark for compiler. Nothing really happens here. For more information check this tutorial_.

.. _tutorial: http://tech.radialpoint.com/2014/02/13/ios-frameworks-initializing-yourself-in-0-lines-of-code/

Connecting
----------

Since server is running on port 8080, one can check the connection for example using favorite browser or curl. If one uses iPhone simulator one can run::
    curl http://127.0.0.1:8080/

And get an error 501 (as the "/" path is not implemented).

Executing code
--------------

Executing code is simple. One should make a GET request with path "run" and query containing code.

Imagine one wants to run::

    @Hello world".length;


One just should make the following request using whatever he wants::

    curl "http://127.0.0.1:8080/run?@\"Hello world\".length"

Output will be something like this (if Tosty_ is not changed yet)::

    run: @"Hello world".length
    11

KindaReplClient
---------------

The repl without console is pain. So I've made a tiny client for this server. It is really tiny and can do a very few things. It's called KindaReplClient_ and written in Haskell.

.. _KindaReplClient: https://github.com/Tanchey/KindaReplClient

You have to compile it and then launch like this::

    ./Main http://127.0.0.1:8080

And then use just like Tosty_.

