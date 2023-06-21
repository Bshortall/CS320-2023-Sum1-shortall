(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)

(*
HX-2023-03-24: 10 points
The following is a well-known series:
ln 2 = 1 - 1/2 + 1/3 - 1/4 + ...
Please implement a stream consisting of all the partial
sums of this series.
The 1st item in the stream equals 1
The 2nd item in the stream equals 1 - 1/2
The 3rd item in the stream equals 1 - 1/2 + 1/3
The 4th item in the stream equals 1 - 1/2 + 1/3 - 1/4
And so on, and so forth
//
*)

(* ****** ****** *)


val the_ln2_stream: real stream = 
let
    fun loop(acc: real, n: real) = fn() =>
    if Real.floor(n) mod 2 <> 0
    then strcon_cons (acc, loop(acc - 1.0 /(n + 1.0), n+1.0))
    else
    strcon_cons(acc, loop(acc + 1.0 /(n + 1.0), n+1.0))
in
    loop(1.0, 1.0)
end



(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-04.sml] *)
