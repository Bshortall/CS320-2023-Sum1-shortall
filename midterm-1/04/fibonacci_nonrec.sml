(* ****** ****** *)
use "./../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-06: 10 points
Fibonacci numbers can be recursively
defined as follows:
fun fibonacci(x: int): int =
  if x >= 2
  then fibonacci(x-2)+fibonacci(x-1) else x
Please use int1_foldleft to implement the
function fibonacci WITHOUT using recursion.
PLEASE NOTE THAT YOU CANNOT DEFINE RECURSIVE
FUNCTIONS IN YOUR IMPLEMENTATION. If you do,
your implementation is disqualified.
*)

fun fibonacci_nonrec(x: int): int = 
  let
    val f = fn (x: int, y: int) => x+y
    val g = fn (x: int) => x-2
    val h = fn (x: int) => x-1
    val i = fn (x: int) => x>=2
    val j = fn (x: int) => x
  in
    int1_foldleft f j (int1_filter i (int1_map g (int1_range x)))
    + int1_foldleft f j (int1_filter i (int1_map h (int1_range x)))
  end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-midterm1-fibonacci.sml] *)
