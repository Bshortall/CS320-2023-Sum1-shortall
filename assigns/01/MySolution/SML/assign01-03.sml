(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-03: 10 points
//
Please implement a function that converts a given
xlist 'xs' into another xlist 'ys' by removing the
constructor 'xlist_reverse':
//
fun xlist_remove_reverse(xs: 'a xlist): 'a xlist
//
In particular, your implementation should guarantee:
1. 'xs' and 'ys' represent the same list
2. 'ys' does NOT make any use of 'xlist_reverse'
3. 'xs' and 'ys' use the same number of 'xlist_append'
//
*)
  
(* ****** ****** *)

fun
xlist_remove_reverse
(xs: 'a xlist): 'a xlist = 
let
    fun reverse_xlist(x: 'a xlist): 'a xlist =
        case x of
            xlist_nil => xlist_nil
            | xlist_reverse(x2) => reverse_xlist(x2)
            | xlist_cons(x1, x2) => xlist_snoc(reverse_xlist(x2), x1)
            | xlist_snoc(x1, x2) => xlist_cons(x2, reverse_xlist(x1))
            | xlist_append(x1, x2) => xlist_append(reverse_xlist(x2), reverse_xlist(x1))

    fun helper(x: 'a xlist): 'a xlist =
    case x of
        xlist_nil => xlist_nil
        | xlist_reverse(x2) => reverse_xlist(helper(x2))
        | xlist_cons(x1, x2) => xlist_cons(x1, helper(x2))
        | xlist_snoc(x1, x2) => xlist_snoc(helper(x1), x2)
        | xlist_append(x1, x2) => xlist_append(helper(x1), helper(x2))
in
    helper(xs)
end

					   
(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-03.sml] *)
