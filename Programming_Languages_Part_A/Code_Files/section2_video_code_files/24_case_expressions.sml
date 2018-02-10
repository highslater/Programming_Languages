(* Programming Languages, Dan Grossman *)
(* Section 2: Case Expressions *)

datatype mytype = TwoInts of int * int 
                | Str of string 
                | Pizza

		      
fun f x = 
    case x of 
	Pizza => 3 
      | Str s => 8
      | TwoInts(i1,i2) => i1 + i2

(*    | Pizza => 4; (* redundant case: error *) *)
(*fun g x = case x of Pizza => 3 (* missing cases: warning *) *)

				   
				   
datatype roofCut = english of int * int
		  |decimal of real * real
		  |pitch of real
fun slope x = 
    case x of 
	english (rise, run) => Real.toString(2.0 * real(run) / real(rise)) 
      | decimal (rise, run) => Real.toString((rise) / (run))
      | pitch   (p)         => Real.toString( 24.0 * p)
val TEST_1 = slope(english (8, 12)) = "3.0";
val TEST_2 = slope(decimal (8.0, 12.0)) = "0.666666666667";
val TEST_3 = slope(pitch (1.0 / 3.0)) = "8.0";
