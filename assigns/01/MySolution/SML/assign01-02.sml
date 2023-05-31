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

fun
xlist_sub
(xs: 'a xlist, i0: int): 'a = 
if i0 < 0 then raise XlistSubscript
else if i0 = 0 then
  case xs of
    XNil => raise XlistSubscript
  | XCons(x, _) => x
else
  case xs of
    XNil => raise XlistSubscript
  | XCons(_, xf) => xlist_sub(xf(), i0-1) 



(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-02.sml] *)
