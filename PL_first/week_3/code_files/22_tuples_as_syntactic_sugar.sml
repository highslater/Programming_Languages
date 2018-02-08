(* Programming Languages, Dan Grossman *)
(* Section 2: Tuples as Syntactic Sugar *)

(* records are like tuples with user-defined field names
   conversely, tuples are just records with names 1, 2, ..., n
   the only real difference is "by position" vs. "by name"
*)
val a_pair = (3+1,4+2)
val a_record = {second=4+2, first=3+1}

(* actually, tuples *are* just records with names 1, 2, ..., n and
special "by position" syntax -- our first example of "syntactic sugar" *)
val another_pair = {2=5, 1=6}
val sum = #1 a_pair + #2 another_pair

val x = {3="hi", 1=true};
val y = {3="hi", 2=3+2, 1=true};

(*

- a_pair;
val it = (4,6) : int * int
- #2 a_pair;
val it = 6 : int
- #1 a_pair;
val it = 4 : int
- a_record
= ;
val it = {first=4,second=6} : {first:int, second:int}
- #first a_record;
val it = 4 : int
- #second a_record;
val it = 6 : int
- another_pair;
val it = (6,5) : int * int
- #2 another_pair;
val it = 5 : int
- #1 another_pair;
val it = 6 : int
- #1 a_pair + #2 another_pair;
val it = 9 : int
- #2 a_pair + #1 another_pair;
val it = 12 : int
- x;
val it = {1=true,3="hi"} : {1:bool, 3:string}
- y;
val it = (true,5,"hi") : bool * int * string
- #3 x;
val it = "hi" : string
- #3 y;
val it = "hi" : string
- #3 y = #3 x;
val it = true : bool

*)
