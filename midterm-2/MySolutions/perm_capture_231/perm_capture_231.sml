(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
A sequence xs of integers captures '231'
if there are three integers a, b, and c
appearing as a subsequence of in satisfying
c < a < b. Note that a, b, and c doe not have
to appear consecutively in xs.

For instance, [1,3,4,2] does capture '231'
For instance, [1,2,4,3] does not capture '231'
For instance, [1,2,3,4] does not capture '231'
*)

(* ****** ****** *)

(*
fun
perm_capture_231
(xs: int list): bool = ...
*)

fun
perm_capture_231
(xs: int list): bool =
let
    val labeled: (int*int) list = list_labelize(xs)

    fun filter1(element: int*int, labeled_list): (int*int) list =
        list_filter(labeled_list, fn(x,y) => if x < #1 element andalso y > #2 element then true else false)

    fun filter2(element: int*int, nextList): (int*int) list =
        list_filter(nextList, fn(x,y) => if x > #1 element andalso y > #2 element then true else false)

    fun helper2(labeled_list): int =
        list_foldleft(labeled_list, 0, fn(res: int, x: int*int) => 
                                        if filter2(x, labeled_list) <> [] then res+1 else res)

    fun helper1(labeled_list): int = 
        list_foldleft(labeled_list, 0, fn(res: int, x: int*int) => 
                                        res + helper2(filter1(x, labeled_list)))
in
if helper1(labeled) > 0 then true else false
end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm2-perm_capture_231.sml] *)
