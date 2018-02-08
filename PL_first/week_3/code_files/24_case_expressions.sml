(* Programming Languages, Dan Grossman *)
(* Section 2: Case Expressions *)

datatype mytype = TwoInts of int * int 
                | Str of string 
                | Pizza

fun f x = 
    case x of 
	Pizza => 3 
      | Str s => 8
      | TwoInts(i1,i2) => i1 + i2

(*    | Pizza => 4; (* redundant case: error *) *)
(* fun g x = case x of Pizza => 3 (* missing cases: warning *) *)

(*

- f Pizza;
val it = 3 : int
- f (Str "hi");
val it = 8 : int
- f (TwoInts (7,9));
val it = 16 : int

*)
