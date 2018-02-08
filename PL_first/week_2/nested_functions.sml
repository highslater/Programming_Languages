
fun count1 (from : int, to : int) =
  if from = to
  then to :: []
  else from :: count1(from +1, to)


(*##########################################*)


fun count_from_1 (x : int) =
  let
      fun count (from : int, to : int) =
	if from = to
	then to :: []
	else from :: count(from +1, to)
  in
      count (1, x)
  end


(*##########################################*)


fun count_to_x (x : int) =
  let
      fun count (from : int) =
	if from = x
	then x :: []
	else from :: count(from +1)
  in
      count (1)
  end


(*##########################################*)
