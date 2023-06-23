(* ****** ****** *)

use
"./../../../mysmlib/mysmlib-cls.sml";

(* ****** ****** *)

(*
//
// HX-2023-04-20: 20 points
//
Given a list xs and a natural number k0,
perm_counting_out(xs, k0) returns a permutation
of xs where the elements are listed according to
the order they are "counted out" in the following
process of counting:
//
Counting of the elements xs goes left to right
and the first count is 0. When the count reaches
k0, the element being counted is removed (that is,
the element is counted out) and counting starts again
with the following element. If counting reached the
last element remaining in the list, then the next element
to be counted is the first element in the list. Counting
stops when all the elements are counted out.
//
For instance,
perm_counting_out([1,2,3], 0) = [1,2,3]
perm_counting_out([1,2,3], 1) = [2,1,3]
perm_counting_out([1,2,3], 2) = [3,1,2]
perm_counting_out([1,2,3], 3) = [1,3,2]
perm_counting_out([1,2,3,4], 1) = [2,4,3,1]
perm_counting_out([1,2,3,4], 3) = [4,1,3,2]
//
*)

(* ****** ****** *)

(*
fun
perm_counting_out
(xs: int list, k0: int): int list = ...
*)

(*This solution does not work. I overlooked the fact that the start of the next count begins at where we left off, not 0*)
fun
perm_counting_out
(xs: int list, k0: int): int list =
let
    val labeled = list_labelize(xs)

    fun remove_by_idx(theList: int list, idx: int): int list =
    list_map(list_filter(list_labelize(theList), fn(x,y) => x <> idx), fn(x0) => #2 x0)

    fun helper(res: int list, currList: int list, k): int list =
        if currList = [] then res
        else helper(list_extend(res, List.nth(currList, k mod list_length(currList))), 
                    remove_by_idx(currList, k mod list_length(currList)), k)
in
(*I for some reason excluded this line in my written response. I think based on the structure of my code it is quite clear I would have put this exact line in if I were more careful*)
    helper([], xs, k0)
end

(* ****** ****** *)

(* end of [CS320-2023-Spring-midterm2-perm_counting_out.sml] *)
