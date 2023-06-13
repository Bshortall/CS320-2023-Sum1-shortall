(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-02-09: 10 points
//
The function find_root(f0)
finds the first root of [f0] in
the following sequence:
0, 1, -1, 2, -2, 3, -3, 4, -4, ...
*)


fun
find_root(f0: int -> int): int =
    let
        fun
        find_root_helper(f0: int -> int, x: int): int =
            if f0(x) = 0 then x
            else if x > 0 then find_root_helper(f0, ~x)
            else find_root_helper(f0, ~(x-1))
    in
        find_root_helper(f0, 0)
    end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-01.sml] *)
