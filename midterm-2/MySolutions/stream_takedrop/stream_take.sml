(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
fun
stream_take(fxs, n) = ...
*)

(* ****** ****** *)

(* end of [CS320-2023-Sum1-stream_take.sml] *)

fun
stream_take(fxs, n) = fn() =>
    if n <= 0 then strcon_nil
    else
    strcon_cons( fxs, stream_take(fxs, n-1))