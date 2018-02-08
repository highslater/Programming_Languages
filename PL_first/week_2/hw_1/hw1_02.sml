(* 2. Write a function number_in_month that takes a list of dates and a month (i.e., an int) and returns
how many dates in the list are in the given month. fn : (int * int * int) list * int -> int *)

val test2_01 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1
val test2_02 = number_in_month ([(1,2,3),(2,2,3),(3,2,3)],2) = 3
val test2_03 = number_in_month ([(1,1,3),(2,2,3),(3,2,3)],2) = 2
val test2_04 = number_in_month ([(1,1,3),(2,1,3),(3,2,3)],2) = 1
val test2_05 = number_in_month ([(1,1,3),(2,1,3),(3,1,3)],2) = 0

fun number_in_month (ds : (int * int * int) list, m : int) =
  if null ds then 0
  else
      if  #2 (hd ds) = m
      then  1 +  number_in_month((tl ds), m)
      else  number_in_month((tl ds), m)


(*--------------------------------------------------------------------------------*)


