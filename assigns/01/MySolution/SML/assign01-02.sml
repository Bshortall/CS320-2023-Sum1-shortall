(* ****** ****** *)
use "./../../assign01-lib.sml";
(* ****** ****** *)
use "./../../MySolution/SML/assign01-01.sml";
(* ****** ****** *)

(*
//
Assign01-02: 10 points
//
Please implement a function
that does subscripting on xlist DIRECTLY:
//
fun xlist_sub(xs: 'a xlist, i0: int): 'a
//
If 'i0' is an illegal index, then xlist_sub
should raise the XlistSubscript exception.
//
You should NOT convert xlist into list and
then do subscripting.
//
*)

(* ****** ****** *)
(*
fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = 
if i0 < 0 then raise XlistSubscript
else if i0 = 0 then
  case xs of
    xlist_nil => raise XlistSubscript
  | xlist_cons(x, _) => x
  | xlist_snoc(x,_) => x
  | xlist_append(x,_) => x
  | xlist_reverse(x) => x
else
  case xs of
    xlist_nil => raise XlistSubscript
  | xlist_cons(_, xf) => xlist_sub(xf, i0-1)
  | xlist_snoc(_,xf) => xlist_sub(xf, i0-1)
  | xlist_append(_,xf) => xlist_sub(xf, i0-1)
  | xlist_reverse(xf) => xlist_sub(xf, i0-1) 
*)

fun 
xlist_sub
(xs: 'a xlist, i0: int): 'a =
let
  fun helper(x1, i) = 
    case (x1, i) of
      (xlist_nil, _) => raise XlistSubscript
    | (xlist_cons(x, _), 0) => x
    | (xlist_cons(_, x), _) => helper(x, i-1)
    | (xlist_snoc(_, x), 0) => x
    | (xlist_snoc(x, _), _) => helper(x, i-1)
    | (xlist_append(x11, x12), _) => 
        if i < xlist_size(x11) then helper(x11, i)
        else helper(x12, i - xlist_size(x11))
    | (xlist_reverse(x), _) => helper(x, xlist_size(x) - i - 1 )
in
  if i0 < 0 then raise XlistSubscript
  else helper(xs, i0)
end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)
