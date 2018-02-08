(* 

7. Write a function date_to_string that takes a date and returns a string of the form
January 20, 2013 (for example). Use the operator ^ for concatenating strings and the library
function Int.toString for converting an int to a string. For producing the month part, do no
use a bunch of conditionals. Instead, use a list holding 12 strings and your answer to the
previous problem. For consistency, put a comma following the day and use capitalized English
month names: January, February, March, April,
May, June, July, August, September, October, November, December.

val date_to_string = fn : int * int * int -> string

*)


fun date_to_string ( d : int * int * int) =

  let val months = ["January", "February", "March",
		    "April", "May", "June",
		    "July", "August", "September",
		    "October", "November", "December"]

      fun get_nth (ss : string list, n : int) =
	if n = 0 then "value greater than zero required"
	else if n = 1 then hd ss
	else get_nth (tl ss, n-1)

  in

      get_nth(months, (#2 d)) ^ 
      " " ^ Int.toString(#3 d) ^ 
      ", "^ Int.toString(#1 d)

  end


val test7 = date_to_string (2013, 6, 1) = "June 1, 2013"


(*--------------------------------------------------------------------------------*)


