(* Programming Languages, Dan Grossman *)
(* Section 2: Datatype Bindings *)

datatype mytype = TwoInts of int * int 
                | Str of string 
                | Pizza

val a = Str "hi"
val b = Str
val c = Pizza
val d = TwoInts(1+2,3+4)
val e = a

(* Do _not_ redo datatype bindings (e.g., via use "filename.sml".
   Doing so will shadow the type name and the constructors.) 
datatype mytype = TwoInts of int * int | Str of string | Pizza *)


(*

datatype mytype = Pizza | Str of string | TwoInts of int * int
val a = Str "hi" : mytype
val b = fn : string -> mytype
val c = Pizza : mytype
val d = TwoInts (3,7) : mytype
val e = Str "hi" : mytype
val it = () : unit
- a;
val it = Str "hi" : mytype 
- b;
val it = fn : string -> mytype
- c;
val it = Pizza : mytype
- d;
val it = TwoInts (3,7) : mytype
- e;
val it = Str "hi" : mytype

*)
