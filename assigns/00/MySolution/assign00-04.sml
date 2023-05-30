(* ****** ****** *)

use "./../assign00-lib.sml";

(* ****** ****** *)


fun
str2int
(cs: string): int =
let 
    fun helper(i:int): int =
    (*Base Case - Size is 0*)
    if i <= 0 then 0 else
    (*Recursive Case - Return last number of string as int*)
    10 * helper(i-1) + Char.ord(String.sub(cs, i-1)) - Char.ord(#"0")
in
    helper(String.size(cs))
end



(* ****** ****** *)

(* end of [CS320-2023-Spring-assign00-04.sml] *)
