(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is an individual library,
that is, it is NOT shared by the class.
*)
(* ****** ****** *)

(* end of [BUCASCS320-2023-Sum1-mysmlib-ind.sml] *)


fun list_filter(func: 'a -> bool, xs: 'a list): 'a list =
        case xs of
            [] => []
            | x::xs1 => if func x then x::list_filter(func,xs1)
                        else list_filter(func,xs1)

(*Factorial using references - should not use*)
fun fact(x: int): int = 
    let
    val i0 = ref(0)
    val res = ref(1)
    fun loop():unit=
        if !i0 < x then (
            i0 := !i0 + 1;
            res := !res * !i0;
            loop()
        )
        else ()
    in
        loop(); !res
    end

(*******STREAMS********)

datatype 'a strmcon = 
	strmcon_nil
	| strmcon_cons of ('a * (unit -> 'a strmcon))

type 'a stream = unit -> 'a strmcon

(*Maps a stream from type a to type b using defined fopr*)
fun
stream_map(fxs: 'a stream, fopr: 'a -> 'b): 'b stream =
fn() => case fxs of
	strmcon_nil => strmcon_nil
	| strmcon_cons(x1, fxs) => strmcon_cons(fopr(x1), stream_map(fxs, fopr))

(*Filters a stream using defined test function*)
fun
stream_filter(fxs: 'a stream, test: 'a -> bool): 'a stream = fn()=>
case fxs of
	strmcon_nil => strmcon_nil
	| strmcon_cons(x1, fxs) => (
	if not(test(x1))
	then stream_filter(fxs, test)()
	else strmcon_cons(x1, stream_filter(fxs, test))
    )

(*generates prime numbers*)
fun 
sieve(fxs: int stream): int stream = fn() =>
let 
    val strmcon_cons(x1, fxs) = fxs()
in
    strmcon_cons(sieve(stream_filter(fxs, fn x => x mod x1 <> 0)))
end

(*BFS and DFS using Streams*)
datatype node = NODE of int

fun
node_get_neighbors(node): node list = []


(*Depth First Search*)
fun dfs_walk(node): node stream = fn() =>
strmcon_cons(node, dfs_walk(node_get_neighbors(node)))


(*Breadth First Search*)
