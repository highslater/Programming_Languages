
fun bad_max (xs : int list) =
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else if hd xs > bad_max (tl xs)
  then hd xs
  else bad_max (tl xs)

(*################################*)

fun better_max (xs : int list) =
  if null xs
  then 0
  else if null (tl xs)
  then hd xs
  else
      let val tl_ans = better_max (tl xs)
      in
	  if hd xs > tl_ans
	  then hd xs
	  else tl_ans
      end

(*################################*)

fun count_up (from : int, to : int) =
  if from = to
  then to :: []
  else from :: count_up (from + 1, to)

(*################################*)

fun count_down (from : int, to : int) =
  if from = to
  then to :: []
  else from :: count_down (from - 1, to)

(*################################*)
