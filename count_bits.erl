-module(count_bits).
-export([count_bits/1]).
-on_load(init/0).

init() ->
    ok = erlang:load_nif("./count_bits_nif", 0).

count_bits(_) ->
    exit(nif_library_not_loaded).
