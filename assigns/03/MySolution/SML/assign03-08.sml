(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-12: 10 points
Please implement the following function
that turns a list of streams into stream of
lists.
//
fun
stream_ziplst('a stream list): 'a list stream
//
If we use a list of streams to represent a
list of rows of a matrix, then the returned
stream consist of lists that are columns of the
matrix.
*)

fun
stream_ziplst(str_list: 'a stream list): 'a list stream =
let

val get_values: 'a list stream = list_foldl(str_list, [], fn(acc: 'a list, x) => list_extend(acc, hd(x) ) )

in
 get_values
end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-08.sml] *)
