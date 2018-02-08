(*--------------------------------------------------------------------------------*)


(*

11. Write a function oldest that takes a list of dates and evaluates to an
(int*int*int) option. It evaluates to NONE if the list has no dates and SOME d if
the date d is the oldest date in the list.

val oldest = fn : (int * int * int) list -> (int * int * int) option

*)

fun is_older (date_1: int * int* int, date_2: int * int * int) =
  (#1 date_1) < (#1 date_2)
  orelse (#1 date_1) = (#1 date_2)
	 andalso (#2 date_1) < (#2 date_2) 
  orelse (#1 date_1) = (#1 date_2)
	 andalso (#2 date_1) = (#2 date_2)
	 andalso (#3 date_1) < (#3 date_2)
 

(*
fun oldest (ds : (int * int * int) list) =
  if null ds orelse null (tl ds) then []
  else
      if is_older (hd ds, hd(tl ds))
      then hd ds :: oldest(tl ds)
      else oldest(tl ds)
*)


(*
fun oldest (ds : (int * int * int) list) =
  if null ds then []
  else
      if null (tl ds) then [hd ds]
      else
	  if is_older (hd ds, hd(tl ds))
	  then (hd ds) :: oldest(tl(tl ds))
	  else (oldest(tl ds))
*)


fun oldest (ds : (int * int * int) list) =
  if null ds then NONE
  else
      let val tl_ans = oldest (tl ds)
      in
	  if isSome tl_ans andalso is_older (valOf tl_ans, hd ds)
	  then tl_ans
	  else
	      SOME (hd ds)
      end



val test11a = oldest([]) = NONE
val test11b = oldest([(2012,2,28)]) = SOME (2012,2,28)
val test11f = oldest([(2012,2,28),(2011,3,31)]) = SOME (2011,3,31)
val test11g = oldest([(2011,3,31),(2012,2,28)]) = SOME (2011,3,31)

val test11c = oldest([(2012,2,28),(2011,4,28), (2011,3,31)]) = SOME (2011,3,31)
val test11e = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)
val test11h = oldest([(2011,4,28),(2012,2,28),(2011,3,31)]) = SOME (2011,3,31) (*FAIL*)
val test11i = oldest([(2011,3,31),(2011,4,28),(2012,2,28)]) = SOME (2011,3,31)
val test11j = oldest([(2011,4,28), (2011,3,31),(2012,2,28)]) = SOME (2011,3,31)
val test11k = oldest([(2011,3,31),(2011,4,28),(2012,2,28)]) = SOME (2011,3,31)

val test11d = oldest([(1963,4,10),(2012,2,28),(2011,4,28),(2011,3,31)]) = SOME (1963,4,10)
val test11l = oldest([(2012,2,28),(1963,4,10),(2011,4,28),(2011,3,31)]) = SOME (1963,4,10)
val test11m = oldest([(2012,2,28),(2011,4,28),(1963,4,10),(2011,3,31)]) = SOME (1963,4,10)
val test11n = oldest([(2012,2,28),(2011,4,28),(2011,3,31),(1963,4,10)]) = SOME (1963,4,10)
val test11o = oldest([(1963,4,10),(2012,2,28),(2011,4,28),(2011,3,31)]) = SOME (1963,4,10)

val test11p = oldest([(2011,4,28),(2012,2,28),(2011,3,31),(1963,4,10)]) = SOME (1963,4,10) (*FAIL*)
val test11q = oldest([(5,5,2),(5,10,2),(5,2,2),(5,12,2)]) = SOME (5,2,2) (* FAIL *)

(*

oldest: Tried to find the oldest date in: [(5,5,2),(5,10,2),(5,2,2),(5,12,2)],
should have found: Some (5,2,2) but your function said otherwise. [incorrect answer]
prob12 tests failed to run
(most likely caused by an incorrect function signature in the submission)
prob13 tests failed to run
(most likely caused by an incorrect function signature in the submission)

Because the auto-grader gave a score above 80, here is the link to a message from a
very cute dog:
https://drive.google.com/file/d/0B5sUgbs6aDNpRDlPRHhkdTVEUXM/view?pref=2&pli=1

*)
(*--------------------------------------------------------------------------------*)
