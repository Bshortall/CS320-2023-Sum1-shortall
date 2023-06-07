(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-03-01: midterm1-02: 10 points
*)
(* ****** ****** *)
(*
Given a list xs, list_pairing(xs) returns
a list of pairs and an option; the 1st pair
consists of the first and last elements in xs,
and the 2nd pair consists of the second and the
second last elements in xs, and so on and so forth;
and the option is NONE if |xs| is even, and it is
SOME(xm) if |xs| is odd and xm is the middle element
in xs.
//
For instance, we have:
//
list_pairing([]) = ([], NONE)
list_pairing([1]) = ([], SOME(1))
list_pairing([1,2]) = ([(1,2)], NONE)
list_pairing([1,2,3]) = ([(1,3)], SOME(2))
list_pairing([1,2,3,4]) = ([(1,4),(2,3)], NONE)
//
Yes, you can define recursive functions in your
implementation.
//
*)
(* ****** ****** *)

fun
list_pairing
(xs: 'a list): ('a * 'a) list * 'a option = 
let
    val n = length(xs)
    fun pairs_helper(xs: 'a list, ys: ('a * 'a) list, i:int): ('a * 'a) list =
        if i >= n div 2 then ys
        else pairs_helper(tl(xs), ys@[(hd(xs), List.nth(xs, length(xs) - 1 - i))], i+1)


    fun opt_helper(xs: 'a list, ys: ('a * 'a) list): ('a * 'a) list * 'a option =
        if length(xs) mod 2 = 0 then (ys, NONE)
        else (ys, SOME(List.nth(xs, length(xs) div 2)) )
        

in

opt_helper(xs, pairs_helper(xs, [], 0))

end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-list_pairing.sml] *)
