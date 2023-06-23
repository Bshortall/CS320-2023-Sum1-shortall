(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_drop(fxs, n) = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_drop.sml] *)

fun
stream_drop(fxs, n) = fn() =>
if n <= 0 then strcon_cons(fxs, stream_drop(fxs, n-1))
    else
    stream_drop(fxs, n-1)()
