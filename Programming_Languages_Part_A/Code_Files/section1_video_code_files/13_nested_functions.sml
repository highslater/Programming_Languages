(* Programming Languages, Dan Grossman *)
(* Section 1: Nested Functions *)


fun count (from : int, to : int) =
    if from = to
    then to :: []
    else from :: count(from +1, to)

		      
fun countup_from_1a (x : int) =
    count(1, x)

	 
fun countup_from1 (x : int) =
    let fun count (from:int, to:int) =
	    if from = to
	    then to :: [] (* note: can also write [to] *)
	    else from :: count(from + 1, to)
    in
	count(1, x)
    end

	
fun countup_from1_better (x : int) =
    let fun count (from:int) =
	    if from=x
	    then x::[]
	    else from :: count(from+1)
    in
	count 1
    end;


				    
(******************************************************)


fun cd_to_1 (x : int) =
    let
	fun count(from : int, to : int) =
	    if to = from
	    then to :: []
	    else from :: count(from - 1, to)
		
    in
	count(x, 1)
    end;


fun cd2_to_1 (x : int) =
     let
	fun count(from : int) =
	    if from = 1
	    then from :: []
	    else from :: count(from - 1)
		
    in
	count(x)
     end;



val count_TEST = count(6, 13) = [6,7,8,9,10,11,12,13]
val countup_from_1a_TEST = countup_from_1a(7) = [1,2,3,4,5,6,7];
val cd2_TEST = cd2_to_1(6) = [6,5,4,3,2,1];
