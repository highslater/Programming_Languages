(* 1. Write a function is_older that takes two dates and evaluates to true or false. It evaluates to true if
the first argument is a date that comes before the second argument. (If the two dates are the same,
the result is false.) fn : (int * int * int) * (int * int * int) -> bool *)


fun is_older (date_1: int * int* int, date_2: int * int * int) =
  (#1 date_1) < (#1 date_2)
  orelse (#1 date_1) = (#1 date_2)
	 andalso (#2 date_1) < (#2 date_2) 
  orelse (#1 date_1) = (#1 date_2)
	 andalso (#2 date_1) = (#2 date_2)
	 andalso (#3 date_1) < (#3 date_2)
 

(*--------------------------------------------------------------------------------*)
