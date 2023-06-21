(* ****** ****** *)
use
"./../../../../mysmlib/mysmlib-cls.sml";
(* ****** ****** *)
(*
HX-2023-06-12: 20 points
*)
(* ****** ****** *)
(*
Note that you are not allowed to define
recursive functions for solving this one.
*)
(* ****** ****** *)
(*
Here are some functions that you can use in
your solution to this one.
*)
val
strsub = String.sub
val
string_length = String.size
val
string_implode = String.implode
val
string_filter = foreach_to_filter_list(string_foreach)
val
string_tabulate =
fn(len, fopr) => string_implode(list_tabulate(len, fopr))

(* ****** ****** *)

(*
A word here is defined to be a (possibly empty)
sequence of lowcase letters in the English alphabet.
Two words w1 and w2 are neighbors if they are of the
same length and differ by exactly one letter.
//
For instance, [water] and [later] are neighbors.
For instance, [abcde] and [abxde] are neighbors.
For instance, [abcde] and [abcde] are not neighbors.
//
Given a word, the function [word_neighbors] returns
a list consisting of *all* the neighbors of the word.
//
fun word_neighbors(word: string): string list = ...
//
Please give an implementation of word_neighbors.
Note that you are NOT allowed to define recursive functions
in your implementation.
//
*)

(* ****** ****** *)

val AB =
"abcdefghijklmnopqrstuvwxyz"

(* ****** ****** *)

val
string_iforeach =
foreach_to_iforeach(string_foreach)

(*Seperates a string into a list of characters, and applies fopr to each char*)
val
string_imap_list =
fn(cs, ifopr) =>
foreach_to_map_list(string_iforeach)(cs, ifopr)

(* ****** ****** *)


(*write function that takes index, replaces the char at index with alphabet - current letter*)
(*converts to a string, append to result*)

val
word_neighbors = fn(word: string) => let

val seperated_word = string_imap_list(word, fn(c) => c)

(*replaces characater at index with ch*)
fun replace_char_by_index(index: int, ch: char) = list_foldl(seperated_word, [], fn(acc: char list, (i, c)) => if i = index then list_append(acc, [ch]) else list_append( acc, [c]))

(*convert char list to string*)
fun implode(cs: char list): string = 
String.implode cs

(*finds all neighbors (including same word) by index*)
fun neighbors_by_index(index: int): string list = 
  string_foldleft(AB, [], fn(acc: string list, c) => list_extend(acc, implode(replace_char_by_index(index, c))) )

(*finds all neighbors for all indicies (includes base word)*)
fun all_neighbors(): string list = 
list_foldl(seperated_word, [], fn(acc: string list, (i, c)) => list_append(acc, neighbors_by_index(i)))

in
(*filter out base word*)
list_filter(all_neighbors(), fn(w) => w <> word)
end





(* ****** ****** *)

(* end of [CS320-2023-Sum1-assign03-02.sml] *)
