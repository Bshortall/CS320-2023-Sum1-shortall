(* ****** ****** *)
use "./../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-02-10: 20 points
Given a list of integers xs,
please implement a function that find
the longest ascending subsequences of [xs].
If there are more than one such sequences,
the left most one should be returned.

fun list_longest_ascend(xs: int list): int list
*)

(*
fun 
list_longest_ascend(xs: int list): int list =
let 
    fun last (xs: int list): int =
        case xs of
            [] => 0
            | x::nil => x
            | x::xs' => last(xs')

    fun get_subset(xs:int list, res: int list): int list =
    case xs of 
        [] => res
        | x::xs' => if last(res) <= x then get_subset(xs', res@[x]) else get_subset(xs', res)

    fun find_longest(xs: int list, res: int list, size:int): int list =
    case xs of 
        [] => res
        | x::xs' => if size < length(get_subset(x::xs', [])) then find_longest(xs', get_subset(x::xs', []), length(get_subset(x::xs', []))) else find_longest(xs', res, size)

in
find_longest(xs, [],0)
end
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

fun is_ascending(xs: int list): bool =
    let
        fun is_ascending'(xs: int list): bool =
            case xs of
                [] => true
              | [x] => true
              | x :: y :: ys => x <= y andalso is_ascending'(y :: ys)
    in
        is_ascending'(xs)
    end

fun list_longest_ascend(xs: int list): int list =
let

val subsets: int list list = list_subsets(xs)

fun helper(xs: int list list, res: int list): int list =
    case xs of
        [] => res
        | x :: xs' => if is_ascending(list_reverse(x)) andalso length(x) > length(res) then helper(xs', list_reverse(x)) else helper(xs', res)  
in
helper(subsets, [])
end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign02-04.sml] *)
