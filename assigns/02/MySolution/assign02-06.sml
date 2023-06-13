(* ****** ****** *)
use
"./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-05: 10 point
The function [list_subsets]
returns all the subsets of a given
set (where sets are represented as lists)
//
fun
list_subsets
(xs: 'a list): 'a list list =
(
case xs of
  nil => [[]]
| x1 :: xs =>
  let
    val res = list_subsets(xs)
  in
    res @ list_map(res, fn(xs) => x1 :: xs)
  end
)
//
Please give a NON-RECURSIVE implementation of
list_subsets based on list-combinators. Note that
the order of the elements in a list representation
of a set is insignificant.
//
*)
(* ****** ****** *)

(*)
val
list_subsets =
fn(xs: 'a list) =>
*)

fun list_subsets(xs: 'a list): 'a list list =
    let
        val subsets = [[]]  

        fun add_to_subsets(x: 'a, subsets: 'a list list): 'a list list =
            list_map (subsets, fn (subset: 'a list) => x :: subset)  

        fun process_elements([], subsets: 'a list list): 'a list list =
            subsets
          | process_elements(x :: xs, subsets: 'a list list): 'a list list =
            let
                val new_subsets = add_to_subsets(x, subsets) 
            in
                process_elements(xs, subsets @ new_subsets)  
            end
    in
        process_elements(xs, subsets)
    end

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-06.sml] *)
