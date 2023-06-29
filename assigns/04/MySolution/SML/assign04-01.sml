(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-06-19: 20 points
Given a list xs, stream_permute_list(xs) returns
a stream of ALL the permutations of xs.
For instance, if xs = [1,2,3], then the returned
stream should enumerate the following 6 lists:
[1,2,3], [1,3,2], [2,1,3], [2,3,1], [3,1,2] and [3,2,1]
//
fun
stream_permute_list(xs: 'a list): 'a list stream = ...
//
*)


fun
stream_permute_list(xs: 'a list): 'a list stream = 
let

    fun permutations [] = [[]]
    | permutations (x::xs) =
        let
        val perms = permutations xs
        fun insertEverywhere x [] = [[x]]
            | insertEverywhere x (y::ys) =
            (x::y::ys) :: List.map (fn p => y::p) (insertEverywhere x ys)
        in
        list_concat (list_map (perms,  fn p => insertEverywhere x p) )
        end

    val all_perms = permutations xs

in
list_streamize(all_perms)
end




 

(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign04-01.sml] *)
