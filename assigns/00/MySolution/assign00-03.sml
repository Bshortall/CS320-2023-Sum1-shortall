(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun assert(claim:bool)=
    if not(claim)
    then raise MyAssertExn
    else ()

fun
int2str
(x: int): string =
let
    val _ = assert(x >= 0)
in
    if x < 10
    (*Base Case*)
    then String.str(Char.chr((Char.ord #"0") + x))
    (*Recursive Case*)
    else int2str(x div 10) ^ String.str(Char.chr((Char.ord #"0") + (x mod 10)))
end

(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-03.sml] *)
