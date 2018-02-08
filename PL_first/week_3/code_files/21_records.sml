(* Programming Languages, Dan Grossman *)
(* Section 2: Records *)

val x = {bar = (1+2,true andalso true), foo = 3+4, baz = (false,9) }

val my_niece = {name = "Amelia", id = 41123 - 12}

val brain_part = {id = true, ego = false, superego = false}

(*
REPL

- x;
val it = {bar=(3,true),baz=(false,9),foo=7}
  : {bar:int * bool, baz:bool * int, foo:int}
- #bar x;
val it = (3,true) : int * bool
- #foo x;
val it = 7 : int
- #baz x;
val it = (false,9) : bool * int 

- my_niece;
val it = {id=41111,name="Amelia"} : {id:int, name:string}
- #id my_niece;
val it = 41111 : int
- #name my_niece;
val it = "Amelia" : string

- brain_part;
val it = {ego=false,id=true,superego=false}
  : {ego:bool, id:bool, superego:bool}
- #ego brain_part;
val it = false : bool
- #id brain_part;
val it = true : bool
- #superego brain_part;
val it = false : bool

*)
