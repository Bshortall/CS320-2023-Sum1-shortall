(* ****** ****** *)

use "./../../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)
(*
HX-2023-02-07: 60 points
*)
(* ****** ****** *)

type int2 = int * int
type int3 = int * int * int
type int4 = int * int * int * int
type int5 = int * int * int * int * int

(* ****** ****** *)

(*
The following function int5_sort
is based on ListMergeSort.sort, which is
defined recursively. Given a tuple of 5
integers, int5_sort returns an ordered tuple
of the same 5 integers. For instance,
int5_sort(1, 2, 1, 2, 2) = (1, 1, 2, 2, 2)
int5_sort(3, 1, 2, 5, 2) = (1, 2, 2, 3, 5)
int5_sort(3, 1, 2, 5, 4) = (1, 2, 3, 4, 5)
*)

(*
val
int5_sort =
fn(xs: int5): int5 =
let
val (x1, x2, x3, x4, x5) = xs
val ys =
ListMergeSort.sort(op>=)[x1,x2,x3,x4,x5]
val y1 = hd(ys) and ys = tl(ys)
val y2 = hd(ys) and ys = tl(ys)
val y3 = hd(ys) and ys = tl(ys)
val y4 = hd(ys) and ys = tl(ys)
val y5 = hd(ys) and ys = tl(ys)
in
  (y1, y2, y3, y4, y5)
end
*)

(* ****** ****** *)
(*
Please give a non-recursive implementation of int5_sort
as int5_sort_nr. That is, please implement int5_sort_nr
in a non-recursive manner such that int5_sort(xs) equals
int5_sort_nr(xs) for every 5-tuple xs of the type int5.
*)
(* ****** ****** *)

val
int2_sort_nr =
fn(xs: int2): int2 => 
if #1(xs) > #2(xs) then (#2(xs), #1(xs)) else xs


(* ****** ****** *)

val
int3_sort_nr =
fn(xs: int3): int3 => 
let
  (*sorts first two values*)
  val xs1 = if #1(xs) > #2(xs) then (#2(xs), #1(xs), #3(xs)) else xs
  (*sorts last two values*)
  val xs2 = if #2(xs1) > #3(xs1) then (#1(xs1), #3(xs1), #2(xs1)) else xs1
  (*sorts first two values again*)
  val xs3 = if #1(xs2) > #2(xs2) then (#2(xs2), #1(xs2), #3(xs2)) else xs2
in
  xs3
end

(* ****** ****** *)



val
int4_sort_nr =
fn(xs: int4): int4 => 
let
  (*Sort first three values*)
  val xs1 = int3_sort_nr(#1(xs), #2(xs), #3(xs))

  (*Sort last two values*)
  val xs2 = int2_sort_nr(#3(xs1), #4(xs))

  (*Sort first three values again*)
  val xs3 = int3_sort_nr(#1(xs1), #2(xs1), #1(xs2))

  fun helper (x3: int3, x0:int): int4 = 
  (#1(x3), #2(x3), #3(x3), x0)
in
  helper(xs3, #2(xs2))
end

(* ****** ****** *)

val
int5_sort_nr =
fn(xs: int5): int5 => 
let
  (*Sort first four values*)
  val xs1 = int4_sort_nr(#1(xs), #2(xs), #3(xs), #4(xs))

  (*Sort last two values*)
  val xs2 = int2_sort_nr(#4(xs1), #5(xs))

  (*Sort first four values again*)
  val xs3 = int4_sort_nr(#1(xs1), #2(xs1), #3(xs1), #1(xs2))

  fun helper(x4: int4, x0: int): int5 = 
  (#1(x4), #2(x4), #3(x4), #4(x4), x0)
in
  helper(xs3, #2(xs2))
end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-quiz01-int5_sort_nonrec.sml] *)
