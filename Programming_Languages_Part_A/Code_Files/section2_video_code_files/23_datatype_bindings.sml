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


datatype roofCut = english of int * int
		  |decimal of real
		  |pitch of int * int

val slope1 = english (8, 12)
val slope2 = decimal 0.667
val slope3 = pitch (1, 3)
		 
				      
