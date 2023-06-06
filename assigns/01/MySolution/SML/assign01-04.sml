(* ****** ****** *)

use "./../../assign01-lib.sml";

(* ****** ****** *)

(*
//
Assign01-04: 10 points
//
Please recall the following question in Assign00:
Assign00-04: 10 points
Please implement a function that converts a given
string to an integer:
fun str2int(cs: string): int
In particular, it is expected that str2int(int2str(x)) = x
//
This time you are asked to implement the following
function that only turns a legal representation of an integer
into an integer. By a legal representation of an integer, we
mean a string consisting of a non-empty sequence of digits (where
the digit '0' can be a leading digit).
//
fun str2int_opt(cs: string): int option
//
*)

(* ****** ****** *)


(*)
fun
str2int_opt(cs: string): int option = 
let
    fun isDigit(char: char): bool =
            Char.ord(char) >= Char.ord(#"0") andalso Char.ord(char) <= Char.ord(#"9")

    fun helper(sz:int): int option = 
        if sz <= 0 then SOME(0) else 
        case isDigit(String.sub(cs, sz-1)) of
            true => case helper(sz - 1) of (
                SOME(acc) => SOME(10 * acc + Char.ord(String.sub(cs, sz - 1)) - Char.ord(#"0"))
                | NONE => NONE
            ) 
            | false => NONE
in
    helper(String.size(cs))
end

*)
fun str2int_opt(cs: string): int option =
    let
        fun isDigit(char: char): bool =
            Char.ord(char) >= Char.ord(#"0") andalso Char.ord(char) <= Char.ord(#"9")

        fun helper(sz: int, acc: int, leadingZero: bool): int option =
            if sz <= 0 then
                if leadingZero then
                    NONE
                else
                    SOME(acc)
            else
                case (isDigit(String.sub(cs, sz - 1)), leadingZero) of
                    (true, true) =>
                        helper(sz - 1, 10 * acc + Char.ord(String.sub(cs, sz - 1)) - Char.ord(#"0"), leadingZero)
                  | (true, false) =>
                        helper(sz - 1, 10 * acc + Char.ord(String.sub(cs, sz - 1)) - Char.ord(#"0"), false)
                  | (false, _) =>
                        NONE
    in
        helper (String.size(cs), 0, true)
    end


(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign01-04.sml] *)
