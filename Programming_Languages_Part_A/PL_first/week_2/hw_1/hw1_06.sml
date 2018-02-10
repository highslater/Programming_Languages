(* 

6. Write a function get_nth that takes a list of strings and an int n and returns the n th
element of the list where the head of the list is 1 st . Do not worry about the case where
the list has too few elements: your function may apply hd or tl to the empty list in this
case, which is okay.

val get_nth = fn : string list * int -> string

*)

fun get_nth (ss : string list, n : int) =
  if n = 0 then "value greater than zero required"
  else if n = 1 then hd ss
  else get_nth (tl ss, n-1)

val test6 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there"
val test6a = get_nth (["hi", "there", "how", "are", "you"],
		      0) = "value greater than zero required"
val test6b = get_nth (["hi", "there", "how", "are", "you"],
		      1) = "hi"

(*--------------------------------------------------------------------------------*)
