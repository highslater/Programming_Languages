(*--------------------------------------------------------------------------------*)


(*
 
10. Write a function month_range that takes two days of the year day1 and day2 and
returns an int list [m1,m2,...,mn] where m1 is the month of day1, m2 is the month
of day1+1, ..., and mn is the month of day day2. Note the result will have length
day2 - day1 + 1 or length 0 if day1>day2.

val month_range = fn : int * int -> int list

*)

fun what_month (x : int) = (* 1 <=  x <= 365 *)
  let val days_in_months = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ]
      fun number_before_reaching_sum (sum : int, xs : int list) =
	if hd xs >= sum then 0
	else 1 + number_before_reaching_sum (sum - (hd xs), (tl xs))
  in
      if x > 365 orelse x <= 0 then 0 (* A Graceful NOPE *)
      else 1 + number_before_reaching_sum (x, days_in_months)
  end


fun month_range (d1 : int, d2 : int) =
  if d1 > d2 then []
  else
     what_month (d1)  :: month_range (d1 + 1, d2)


val test10 = month_range (31, 34) = [1,2,2,2]



(*--------------------------------------------------------------------------------*)