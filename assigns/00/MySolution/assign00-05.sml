(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)

fun
stringrev
(cs: string): string = 
let
    fun helper(i0: int): string =
    if i0 < 0 then
        "" : string
    else
        String.str(String.sub(cs, i0)) ^ helper(i0 - 1)
in
    helper(String.size(cs) - 1)
end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-05.sml] *)
