(* 4. Write a function dates_in_month that takes a list of dates and a month
(i.e., an int) and returns a list holding the dates from the argument list of dates
that are in the month. The returned list should contain dates in the order they were
originally given.
val dates_in_month = fn : (int * int * int) list * int -> (int * int * int) list
*)


fun dates_in_month (ds : (int * int * int)list , m) =
  if null ds then [] 
  else if #2 (hd ds) = m then (hd ds) :: dates_in_month (tl ds, m)
  else dates_in_month (tl ds,m )
 



val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4a = dates_in_month ([(2012,2,28),(2013,2,1)],2) = [(2012,2,28), (2013,2,1)]

(*--------------------------------------------------------------------------------*)
