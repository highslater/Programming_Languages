
(* 3. Write a function number_in_months that takes a list of dates and a list of months (i.e., an int list)
and returns the number of dates in the list of dates that are in any of the months in the list of months.
Assume the list of months has no number repeated. Hint: Use your answer to the previous problem.*)


(*--------------------------------------------------------------------------------*)


fun number_in_months (ds : (int * int * int) list, ms : int list) =
  let fun number_in_month (ds : (int * int * int) list) =
	if null ds then 0
	else if  #2 (hd ds) = hd ms then  1 +  number_in_month(tl ds)
	else  number_in_month(tl ds)
  in if null ms then 0
     else number_in_month(ds) + number_in_months(ds, tl ms)
  end


val test3_01 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[5]) = 0
val test3_02 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2]) = 1
val test3_03 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3]) = 1
val test3_04 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[4]) = 1
val test3_05 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3]) = 2
val test3_06 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[3,4]) = 2
val test3_07 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,4]) = 2


(*--------------------------------------------------------------------------------*)

