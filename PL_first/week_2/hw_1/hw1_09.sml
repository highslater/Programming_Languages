(*

9. Write a function what_month that takes a day of year (i.e., an int between 1 and 365)
and returns what month that day is in (1 for January, 2 for February, etc.). Use a list
holding 12 integers and your answer to the previous problem.

val what_month = fn : int -> int

*)
(*
val months = ["January", "February", "March",
	      "April", "May", "June",
	      "July", "August", "September",
	      "October", "November", "December"]

val days_in_months = [ 31, 28, 31, 30,  31,  30,  31,  31,  30,  31,  30,  31 ]
val days_in_year =   [ 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334, 365 ]
val days_to_months =   [ (1, 31), (2, 59), (3, 90), (4, 120), (5, 151), (6, 181),
			 (7, 212), (8, 243), (9, 273), (10, 304), (11, 334),
			 (12, 365) ]
val days_to_MONTHS = [ ("January", 1, 31), ("February", 2, 59), ("March", 3, 90),
		       ( "April", 4, 120), ("May", 5, 151), ("June", 6, 181),
		       ( "July", 7, 212), ("August", 8, 243), ("September", 9, 273),
		       ("October", 10, 304), ( "November", 11, 334),
		       ( "December", 12, 365) ]
*)

fun what_month (x : int) = (* 1 <=  x <= 365 *)
  let val days_in_months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
      fun number_before_reaching_sum (sum : int, xs : int list) =
	if hd xs >= sum then 0
	else 1 + number_before_reaching_sum (sum - (hd xs), (tl xs))
  in
      if x > 365 orelse x <= 0 then 0
      else 1 + number_before_reaching_sum (x, days_in_months)
  end


val test9 = what_month 70 = 3


(*--------------------------------------------------------------------------------*)
