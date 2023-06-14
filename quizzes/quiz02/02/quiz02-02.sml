(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 60 points
//
Please implement a function of the name quiz02_02
that takes two lists xs and ys of integers and checks
whether there exists a pair (x, y) such that |x-y| < 10
where x is in xs and y is in ys.
//
*)

(* ****** ****** *)

val
abs =
fn(x:int) =>
if x >= 0 then x else ~x

(* ****** ****** *)
(*
HX-2023-06-14:
You are not allowed to define recursive functions
to solve this problem. You can use any functions
in mysmlib.sml. If your defines recursive functions,
then it is DISQUALIFIED.
*)
(* ****** ****** *)

(*attempt 1: zipping does not work because the x, y pair do not need to be at the same index
val
quiz02_02 =
fn(xs: int list, ys: int list) => 
list_z2forall(xs, ys, fn(x:int, y:int) => abs(x-y) >= 10)
*)

val
quiz02_02 =
fn(xs: int list, ys: int list) =>
let
val opp: bool = list_forall(xs, fn(x:int) => list_forall(ys, fn(y:int) => abs(x-y) >= 10))
in
not opp
end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-quizzes-quiz02-02.sml] *)

