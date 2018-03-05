(* Dan Grossman, Coursera PL, HW2 Provided Code *)

(* if you use this function to compare two strings (returns true if the same
   string), then you avoid several of the functions in problem 1 having
   polymorphic types that may be confusing *)

		
fun same_string(s1 : string, s2 : string) =
    s1 = s2

val TEST_001 = same_string ("string", "string") = true
val TEST_002 = same_string ("String", "string") = false
	

	
(* put your solutions for problem 1 here *)


	     
(* **************************** Problem 1 *************************************** *)

(*
1. This problem involves using first-name substitutions to come up with alternate
names. For example, Fredrick William Smith could also be Fred William Smith or
Freddie William Smith. Only part (d) is specifically about this, but the other
problems are helpful.
*)
	     
(*

(a) Write a function all_except_option, which takes a string and a string list.

Return NONE if the string is not in the list,
else return SOME lst where lst is identical to the argument list
except the string is not in it.
You may assume the string is in the list at most once.
Use same_string, provided to you, to compare strings.
Sample solution is around 8 lines.

val all_except_option = fn : string * string list -> string list option

*)
(* 1

fun all_except_option (x :string, xs : string list) =
    
    if same_string(x, (hd xs))
    then SOME xs 
    else NONE
 *)

							    
(* 2
							    
fun all_except_option (x :string, xs : string list) =
    case same_string(x, (hd xs)) of
	false => NONE
      | true => SOME xs 
 *)
							    
fun all_except_option (x :string, xs : string list) =
    case same_string(x, (hd xs)) of
	false => NONE
      | true => SOME xs 


	     

(* val test_003 = all_except_option ("string", ["string"]) = SOME [] *)
val test_t31 = all_except_option ("string", ["string"]) = SOME ["string"]	
val test_t32 = all_except_option ("String", ["string"]) = NONE
val test_t33 = all_except_option ("string", ["string", "another"]) =
	       SOME ["string", "another"]

							      
