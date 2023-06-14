(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
//
HX-2023-06-14: 100 points
//
Please implement a function of the name quiz02_03
that takes one list xs of integers and returns a sublist
consisting of every element in xs that is greater than all
the elements after it. For instance, if xs = [3,1,2,1,1],
then the sublist is [3,2,1]; if xs = [5,4,1,2,3], then the
sublist is [5,4,3].
//
*)

(* ****** ****** *)
(*
HX-2023-06-14:
You are not allowed to define recursive functions
to solve this problem. You can use any functions
in mysmlib.sml. If your defines recursive functions,
then it is DISQUALIFIED.
*)
(* ****** ****** *)

(*first label the initial list. then iterates through the labeled list, if the value is greater than the remaining substring it is appended to the result*)
(*find substring by filtering labeled list by index, then mapping to an int list rather than int*int list*)
val quiz02_03 =
fn(xs: int list) =>
let 
val labeled: (int*int) list = list_labelize(xs)
in 
list_foldl(labeled, [], fn(acc:int list, (x1,x2):int*int) => if list_forall(list_map(list_filter(labeled, fn((z1,z2):int*int) => z1>x1), fn((z1,z2):int*int) => z2), fn(y:int) => x2 > y) then list_extend(acc, x2) else acc)
end

(* first attempt: mis read directions
let 

val labeled = list_labelize(xs)
val evens = list_foldl(labeled, [], fn(acc:int list, x: int*int) => if #1 x mod 2 = 0 then list_extend(acc, #2 x) else acc )
val odds = list_foldl(labeled, [], fn(acc:int list, x: int*int) => if #1 x mod 2 <> 0 then list_extend(acc, #2 x) else acc )

in
val res = list_z2forall(evnes, odds, fn(x:int, y:int) => x > y)
end
*)


(* ****** ****** *)

(* end of [CS320-2023-Sum1-quizzes-quiz02-03.sml] *)

