(* ****** ****** *)
(*
HX-2023-05-23:
Library functions
for BUCASCS320-2023-Sum1
This is an individual library,
that is, it is NOT shared by the class.
*)
(* ****** ****** *)

(* end of [BUCASCS320-2023-Sum1-mysmlib-ind.sml] *)


fun list_filter(func: 'a -> bool, xs: 'a list): 'a list =
        case xs of
            [] => []
            | x::xs1 => if func x then x::list_filter(func,xs1)
                        else list_filter(func,xs1)