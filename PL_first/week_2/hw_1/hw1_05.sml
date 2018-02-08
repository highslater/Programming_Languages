(*

5. Write a function dates_in_months that takes a list of dates and a list of months
(i.e., an int list) and returns a list holding the dates from the argument list of dates
that are in any of the months in the list of months. Assume the list of months has no number
repeated. Hint: Use your answer to the previous problem and SML’s list-append operator (@).

val dates_in_months = fn : (int * int * int) list * int list -> (int * int * int) list

*)


fun dates_in_month (ds : (int * int * int)list , m) =
  if null ds then [] 
  else if #2 (hd ds) = m then (hd ds) :: dates_in_month (tl ds, m)
  else dates_in_month (tl ds,m )
 
val test4 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)]
val test4a = dates_in_month ([(2012,2,28),(2013,2,1)],2) = [(2012,2,28), (2013,2,1)]


fun dates_in_months (ds : (int * int * int) list , ms : int list) =
  if null ms then []
  else
      dates_in_month(ds, hd ms) @ dates_in_months(ds, tl ms)


val test5 = dates_in_months(
[(2012,2,28), (2013,12,1),
(2011,3,31), (2011,4,28)],
[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)]



(*--------------------------------------------------------------------------------*)
