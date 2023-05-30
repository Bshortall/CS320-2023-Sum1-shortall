(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)
fun LTEone(y: int): bool =
  if y <= 1 then true else false;

fun
isPrime
(n0: int): bool =
if LTEone(n0) then false else
let
  fun helper(i0: int): bool =
    if i0 > n0 div 2 then true
    else if n0 mod i0 = 0 then false
    else helper(i0 + 1)
in
helper(2)
end


(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-02.sml] *)
