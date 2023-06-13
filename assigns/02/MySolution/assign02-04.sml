(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

fun 
list_longest_ascend(xs: int list): int list =
let 
    fun last (xs: int list): int =
        case xs of
            [] => 0
            | x::nil => x
            | x::xs' => last(xs')

    fun get_subset(xs:int list, res: int list): int list =
    case xs of 
        [] => res
        | x::xs' => if last(res) <= x then get_subset(xs', res@[x]) else get_subset(xs', res)

    fun find_longest(xs: int list, res: int list, size:int): int list =
    case xs of 
        [] => res
        | x::xs' => if size < length(get_subset(x::xs', [])) then find_longest(xs', get_subset(x::xs', []), length(get_subset(x::xs', []))) else find_longest(xs', res, size)

    fun find_longest_longest(xs: int list, res: int list, size:int): int list =
    case xs of
        [] => res
        | x::xs' => 

in
find_longest(xs, [],0)
end




(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)
