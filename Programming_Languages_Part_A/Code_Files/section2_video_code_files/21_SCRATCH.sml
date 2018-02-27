(* Programming Languages, Dan Grossman *)
(* Section 2: SCRATCH *)

(* Section 2: Building Compound Types *)

(* Section 2: Records *)

(*

val RAD_2_DEG = 180.0 / Math.pi
val EQUAL_HIP_UNIT_RUN = Math.sqrt(288.0)

val COMMON = { unit_rise = 8.0, unit_run = 12.0 }
val DORMER = { unit_rise = 2.0 }
val HIP = {unit_run = EQUAL_HIP_UNIT_RUN}
		    
val CALCULATED_COMMON_SLOPE = (#unit_rise COMMON / #unit_run COMMON)
val CALCULATED_DORMER_SLOPE = (#unit_rise DORMER / #unit_run COMMON)
val CALCULATED_HIP_SLOPE = (#unit_rise COMMON / #unit_run HIP)
			    
val COMMON_slope_degrees = Math.atan(CALCULATED_COMMON_SLOPE)*RAD_2_DEG
val COMMON_slope_degrees2 =
    Math.atan2(#unit_rise COMMON, #unit_run COMMON)*RAD_2_DEG
val COMMON_slope_degrees_truncated =
    real(Real.round(Math.atan(CALCULATED_COMMON_SLOPE)*RAD_2_DEG*100.0))/100.0
val COMMON_slope_degrees2_truncated =
    real(Real.round(Math.atan2(#unit_rise COMMON,#unit_run COMMON)
		    *RAD_2_DEG*100.0))/100.0
								      
val DORMER_slope_degrees = Math.atan(CALCULATED_DORMER_SLOPE)*RAD_2_DEG
val DORMER_slope_degrees2 =
    Math.atan2(#unit_rise DORMER, #unit_run COMMON) * RAD_2_DEG
val DORMER_slope_degrees_truncated =
    real(Real.round(Math.atan(CALCULATED_DORMER_SLOPE)*RAD_2_DEG*100.0))/100.0
val DORMER_slope_degrees2_truncated =
    real(Real.round(Math.atan2(#unit_rise DORMER,#unit_run COMMON)
		    * RAD_2_DEG * 100.0)) / 100.0 

val HIP_slope_degrees = Math.atan(CALCULATED_HIP_SLOPE)*RAD_2_DEG 
val HIP_slope_degrees2 = Math.atan2(#unit_rise COMMON, EQUAL_HIP_UNIT_RUN)*RAD_2_DEG
val HIP_slope_degrees_truncated =
    real(Real.round(Math.atan(CALCULATED_HIP_SLOPE)*RAD_2_DEG*100.0))/100.0
val HIP_slope_degrees2_truncated =
    real(Real.round(Math.atan2(#unit_rise COMMON,EQUAL_HIP_UNIT_RUN)
		    *RAD_2_DEG*100.0))/100.0

*)								      
(* Section 2: Tuples as Syntactic Sugar *)

(* records are like tuples with user-defined field names
   conversely, tuples are just records with names 1, 2, ..., n
   the only real difference is "by position" vs. "by name"
 *)

(* actually, tuples *are* just records with names 1, 2, ..., n and
special "by position" syntax -- our first example of "syntactic sugar" *)

(*

val roof_cut = (8, 12.0)
val roof_cut2 = {rise = 8, run = 12.0}
val sum1 = #1 roof_cut + #rise roof_cut2
val sum2 = #2 roof_cut + #run roof_cut2

val pair = (1,3)
val another_pair = {2 = 5, 1 = 6}
val sum3 = #2 pair + #2 another_pair

val first = { one = 1, two = 2, three = 3 }
val second = { 1 = 3, 2 = 2, 3 = 1 }
val sum4 = #two first + #2 second

val TEST_1 = #1 roof_cut = #rise roof_cut2
val TEST_2 = Real.compare((#2 roof_cut), (#run roof_cut2)) = EQUAL
val TEST_3 = Int.compare((#1 roof_cut), (#rise roof_cut2)) = EQUAL

*)


(* Section 2: Datatype Bindings *)


datatype roofCut1 =  English1 of int * int
		  | Decimal1 of real * real
		  | Pitch1 of int * int
		  | Descriptive1 of string
		  | Metric1 of real * real

				   
fun slope_1 (x : roofCut1) = (* make with : roofCut and : roofCut2*)
    case x of 
	English1 (rise, run) => Real.toString(2.0 * real(run) / real(rise)) 
      | Decimal1 (rise, run) => Real.toString((rise) / (run))
      | Pitch1 (rise, run) => Real.toString(2.0 * real(run) / real(rise))
      | Descriptive1 (s) => s
      | Metric1 (rise, run) => Real.toString((rise) / (run))

			      
val TEST_001 = slope_1(English1 (8, 12)) = "3.0";
val TEST_002 = slope_1(Decimal1 (8.0, 12.0)) = "0.666666666667";
val TEST_003 = slope_1(Pitch1 (8, 12)) = "3.0";
val TEST_004 = slope_1(Metric1 (5.0, 10.0)) = "0.5";
val TEST_005 = slope_1(Descriptive1 "Quarter") = "Quarter";


(* Section 2: Case Expressions *)
				   
				   
datatype roofCut2 = English2 of int * int
		  | Decimal2 of real * real
		  | Pitch2 of int * int
		  | Descriptive2 of string
		  | Metric2 of real * real

				   
fun slope_2 (y : roofCut2) = (* make with : roofCut and : roofCut2*)
    case y of 
	English2 (rise, run) => Real.toString(2.0 * real(run) / real(rise)) 
      | Decimal2 (rise, run) => Real.toString((rise) / (run))
      | Pitch2 (rise, run) => Real.toString(2.0 * real(run) / real(rise))
      | Descriptive2 (s) => s
      | Metric2 (rise, run) => Real.toString((rise) / (run))

			      
val TEST_006 = slope_2(English2 (8, 12)) = "3.0";
val TEST_007 = slope_2(Decimal2 (8.0, 12.0)) = "0.666666666667";
val TEST_008 = slope_2(Pitch2 (8, 12)) = "3.0";
val TEST_009 = slope_2(Metric2 (5.0, 10.0)) = "0.5";
val TEST_010 = slope_2(Descriptive2 "Quarter") = "Quarter";
val TEST_011 = String.size(slope_2(Descriptive2 "Quarter")) = 7;


(* Section 2: Useful Datatypes *)

datatype roof = Decimal | Descriptive | English | Metric | Pitch 		
datatype pitch = Eighth | Quarter | Third | Half | Full | Num of int

fun eval_pitch (p : pitch)  =
    case p of
        Eighth  => (3, 12)
      | Quarter => (6, 12)
      | Third => (8, 12)
      | Half => (12, 12)
      | Full => (24, 12)
      | Num x => (x, 12)

val TEST_012 = eval_pitch Eighth = (3, 12);
val TEST_013 = eval_pitch Quarter = (6, 12);
val TEST_014 = eval_pitch Third = (8, 12);
val TEST_015 = eval_pitch Half = (12, 12);
val TEST_016 = eval_pitch Full = (24, 12);
val TEST_017 = eval_pitch (Num 7) = (7, 12);

							    
datatype id = StudentNum of int 
            | Name of string  * (string option) * string

val sn = StudentNum 42
val fl = Name ("First", NONE, "Last") : id
val fml = Name ("First", SOME "Middle", "Last") : id
(* 1

fun eval_id (i : id)  =
    
    let
	fun eval_middle t =
	    case t of
		NONE   => ""
	      | SOME x => x
			      
    in
	
    case i of
        StudentNum x  => Int.toString(x)
      | Name x => String.concatWith "*" [#1 x, eval_middle(#2 x), #3 x]

    end

*)
(* 2

fun eval_id (i : id)  =
    let
	fun eval_middle t =
	    case t of
		NONE   => ""
	      | SOME x => x			      
    in	
	case i of
            StudentNum x  => Int.toString(x)
	  | Name x =>
	    let
		val m = (#2 x)
		val middle = eval_middle m
	    in
		if isSome (m)
		then String.concatWith "*" [#1 x, middle, #3 x]
		else String.concatWith "*" [#1 x, #3 x]
	    end
    end

*)

(* 3
						      
fun eval_id (i : id)  =
   
	case i of
            StudentNum x  => Int.toString(x)
	  | Name x =>
	    let
		fun eval_middle t =
		    case t of
			NONE   => ""
		      | SOME x => x
	    in
		if isSome (#2 x)
		then String.concatWith "*" [#1 x, eval_middle (#2 x), #3 x]
		else String.concatWith "*" [#1 x, #3 x]
	    end

*)

(* 4
						      
fun eval_id (i : id)  =
    case i of
        StudentNum x  => Int.toString(x)
      | Name x =>
	if isSome(#2 x)
	then String.concatWith " " [#1 x, valOf(#2 x), #3 x]
	else String.concatWith " " [#1 x, #3 x]

 *)
(* 5

fun eval_id (i : id)  =
    case i of
        StudentNum x  => Int.toString(x)
      | Name x =>
	let
	    fun eval t= 
		case t of
		    NONE => String.concatWith " " [#1 x, #3 x]
		  | SOME t  => String.concatWith " " [#1 x, valOf(#2 x), #3 x]
	in eval (#2 x)
	end
*)
(* 6

fun eval_id (i : id)  =
    case i of
        StudentNum x  => Int.toString(x)
      | Name x =>
	let fun evalX t =
		case t of
		    NONE => String.concatWith " " [#1 x, #3 x]
		  | SOME t  => String.concatWith " " [#1 x, valOf(#2 x), #3 x]
	in evalX (#2 x) end
*)

(*						      
fun eval_id (i : id)  =
    case i of
        StudentNum x  => Int.toString(x)
      | Name x =>
	let fun evalX t =
		case t of
		    NONE => #1 x ^ " " ^ #3 x
		  | SOME t  => #1 x ^ " " ^ valOf(#2 x) ^ " " ^ #3 x
	in evalX (#2 x) end
*)

fun eval_id (i : id)  =
    case i of
	StudentNum x  => Int.toString(x)
      | Name (f, m, l) =>
	case m of
	    NONE => f ^ " " ^ l
	  | SOME m  => f ^ " " ^ m ^ " " ^ l 
	


				       
(*----------------------------------------------------------------*)
					
val TEST_T01 = "42" = Int.toString(42);
val TEST_fml = (SOME "Middle");
val TEST_fl = (NONE);

fun TEST_eval t =
    case t of
	NONE => "nothing here"
      | SOME x => x
		      
val TEST_T02 = TEST_eval TEST_fml = "Middle"
val TEST_T03 = TEST_eval TEST_fl = "nothing here"
val TEST_T04 = isSome(TEST_fml) = true
				       
(*----------------------------------------------------------------*)

				       
		      
val TEST_018 = eval_id sn = "42"
val TEST_019 = eval_id fl = ("First Last")
val TEST_020 = eval_id fml = ("First Middle Last")


						   
datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

fun eval e =
    case e of
        Constant i => i
      | Negate e2  => ~ (eval e2)
      | Add(e1,e2) => (eval e1) + (eval e2)
      | Multiply(e1,e2) => (eval e1) * (eval e2)

					   
fun number_of_adds e =
    case e of
        Constant i      => 0
      | Negate e2       => number_of_adds e2
      | Add(e1,e2)      => 1 + number_of_adds e1 + number_of_adds e2
      | Multiply(e1,e2) => number_of_adds e1 + number_of_adds e2

							      
val example_exp : exp = Add (Constant 19, Negate (Constant 4))
val example_ans : int = eval example_exp
val example_addcount = number_of_adds (Multiply(example_exp,example_exp))
val h : int = 8
val i : real = 8.0
val j : string = "8"
val k : bool = true
val l : char = #"l"


(* Section 2: Type Synonyms *)

type ROOF = roof * pitch
val r1 : ROOF = (English, Full)
val r2 : ROOF = (English, Half)
		    
fun is_full_pitch1 (r : ROOF)=
    #1 r = English  andalso #2 r =  Full

fun is_full_pitch2 (r : ROOF)=
    case r of
	(English, Full) => true
      | _ => false 
					
val TEST_T05 = is_full_pitch1 r1 = true
val TEST_T06 = is_full_pitch2 r1 = true
val TEST_T07 = is_full_pitch1 r2 = false
val TEST_T08 = is_full_pitch2 r2 = false
    

		   
datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank
		       
type name_record = { student_num : int option, 
                     first       : string, 
                     middle      : string option, 
                     last        : string }
		       
fun is_Queen_of_Spades1 (c : card) = 
    #1 c = Spade andalso #2 c = Queen
				    
val c1 : card = (Diamond,Ace)
val c2 : suit * rank = (Heart,Ace)
val c3 = (Spade,Ace)
val c4 : suit * rank = (Spade,Queen)

fun is_Queen_of_Spades2 (c) =
    case c of
	(Spade,Queen) => true
      | _ => false
		 
val TEST_021 = is_Queen_of_Spades2 c1 = false;
val TEST_022 = is_Queen_of_Spades2 c2 = false;
val TEST_023 = is_Queen_of_Spades2 c3 = false;
val TEST_024 = is_Queen_of_Spades2 c4 = true;


(* Section 2: Another Expression Example *)


datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

				     

(* Note: example as explained in video assumes there is no library function
   for max of two ints.  There is: Int.max *)

				     
fun max_constant e =
    let fun max_of_two (e1,e2) =
	    let val m1 = max_constant e1
		val m2 = max_constant e2
	    in 
		if m1 > m2 then m1 else m2 
	    end
    in
	case e of
	    Constant i      => i
	  | Negate e2       => max_constant e2
	  | Add(e1,e2)      => max_of_two(e1,e2)
	  | Multiply(e1,e2) => max_of_two(e1,e2)
    end


	
val test_exp = Add (Constant 19, Negate (Constant 4))
val test_exp2 = Add (Negate (Constant 5), Negate (Constant 4))
val nineteen = max_constant test_exp = 19;
val five = max_constant test_exp2 = 5;


			    
(* Note: Using Int.max, we don't need a local helper function. 
This second version is fewer lines, but there is a bit more
code copying. *)

			    
fun max_constant2 e =
    case e of
	Constant i      => i
      | Negate e2       => max_constant2 e2
      | Add(e1,e2)      => Int.max(max_constant2 e1, max_constant2 e2)
      | Multiply(e1,e2) => Int.max(max_constant2 e1, max_constant2 e2)



(* Section 2: Lists and Options are Datatypes *)


(* ------------------------------------------------ *)
				  
datatype my_int_list = Empty 
                     | Cons of int * my_int_list
					 
val one2345 = Cons(1,Cons(2,Cons(3,Cons(4, Cons(5, Empty)))))
val six789 = Cons(6,Cons(7,Cons(8,Cons(9, Empty))))
					 
fun eval_mil (xs) =
    case xs of
	Empty => []
      | Cons(x,xs') => x :: eval_mil(xs')

				    
fun append_mil (xs,ys) = 
    case xs of
        Empty => ys
      | Cons(x,xs') => Cons(x, append_mil(xs',ys))
			   
	     
(* ------------------------------------------------ *)
				    
val zero = NONE;
val five = SOME 5;
val nada = [];
val mucho = [1,2,3,4,5,6,7,8,9];
val uno2345 = eval_mil one2345;
val sais789 = eval_mil six789;
			   
fun inc_or_zero intoption =
    case intoption of
        NONE => 0
      | SOME i => i+1

fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list xs'

fun append (xs,ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs',ys)

			     
val TEST_025 = eval_mil one2345 = [1,2,3,4,5];
val TEST_026 = eval_mil(append_mil(one2345, six789)) = [1,2,3,4,5,6,7,8,9];
val TEST_027 = inc_or_zero zero = 0;
val TEST_028 = inc_or_zero five = 6;
val TEST_029 = sum_list nada = 0;
val TEST_030 = sum_list mucho = 45;
val TEST_031 = append(uno2345, sais789) = [1,2,3,4,5,6,7,8,9];
val TEST_032 = append(uno2345, sais789) = eval_mil(append_mil(one2345, six789))
						  
(* This causes shadowing errors comment out in order to work *)
			     
(* 
(* Section 2: Polymorphic Datatypes *)

(* type is int list -> int *)
fun sum_list xs =
    case xs of
        [] => 0
      | x::xs' => x + sum_list xs'

(* type is 'a list * 'a list -> 'a list *)
fun append (xs,ys) =
    case xs of
        [] => ys
      | x::xs' => x :: append(xs',ys)

(* this really is /exactly/ how options are defined 
   careful: now shadowing the built in ones!
 *)
			     

datatype 'a option = NONE | SOME of 'a 


			     
(* similarly, here are polymorphic lists but without special syntax *)

datatype 'a mylist = Empty | Cons of 'a * 'a mylist

(* a fancier example for binary trees where internal nodes have data of
   any one type and leaves have data of another possibly-different type *)

datatype ('a,'b) tree = Node of 'a * ('a,'b) tree * ('a,'b) tree
		      | Leaf of 'b

(* type is (int,int) tree -> int *)
fun sum_tree tr =
    case tr of
	Leaf i => i
     | Node(i,lft,rgt) => i + sum_tree lft + sum_tree rgt

(* type is ('a,int) tree -> int *)
fun sum_leaves tr =
    case tr of
	Leaf i => i
     | Node(i,lft,rgt) => sum_leaves lft + sum_leaves rgt

(* type is ('a,'b) tree -> int *)
fun num_leaves tr =
    case tr of
	Leaf i => 1
      | Node(i,lft,rgt) => num_leaves lft + num_leaves rgt

*)


(* Section 2: Pattern-Matching for Each-Of Types: 
              The Truth About Function Arguments *)

						  

datatype StudentId = S_Num of int 
		   | S_Name of string  * (string option) * string

							       
val SIsn = S_Num 20181976
val SIfl = S_Name ("First", NONE, "Last") : StudentId
val SIfml = S_Name ("First", SOME "Middle", "Last") : StudentId

						      
fun eval_Student_id (i : StudentId)  =
    case i of
	S_Num x  => Int.toString(x)
       |S_Name (f, m, l) =>
	case m of
	    NONE => f ^ " " ^ l
	  | SOME m  => f ^ " " ^ m ^ " " ^ l 

					       
val TEST_033 = eval_Student_id SIsn = "20181976"
val TEST_034 = eval_Student_id SIfl = ("First Last")
val TEST_035 = eval_Student_id SIfml = ("First Middle Last")

					       

fun sum_triple1 (triple : int * int * int) =
    case triple of
	(x,y,z) => z + y + x

			       
fun sum_triple2 triple =
    let val (x,y,z) = triple 
    in 
        x + y + z 
    end

	
fun sum_triple3 (x,y,z) =
    x + y + z

			     
fun full_name1 (r : {first:string,middle:string,last:string}) =
    case r of 
        {first=x,middle=y,last=z} => x ^ " " ^ y ^ " " ^z

							    
fun full_name2 (r : {first:string,middle:string,last:string}) =
    let val {first=x,middle=y,last=z} = r
    in
	x ^ " " ^ y ^ " " ^z
    end

	
	
fun full_name3 {first=x,middle=y,last=z} =
    x ^ " " ^ y ^ " " ^z


		
fun rotate_left (x,y,z) = (y,z,x)

			      
fun rotate_right triple = rotate_left(rotate_left triple)


						       
(* Section 2: A Little Type Inference *)

fun sum_triple4 (x, y, z) =
    x + y + z

fun full_name4 {first=x, middle=y, last=z} =
    x ^ " " ^ y ^ " " ^ z

(* these versions will not type-check without type annotations because
   the type-checker cannot figure out if there might be other fields *)
fun sum_triple5 (triple : int*int*int) =
	   #1 triple + #2 triple + #3 triple

fun full_name5 (r : {first:string, middle:string,
                    last:string}) =
      #first r ^ " " ^ #middle r ^ " " ^ #last r

(* these functions are polymorphic: type of y can be anything *)

fun partial_sum (x, y, z) = 
    x + z

fun partial_name {first=x, middle=y, last=z} =
    x ^ " " ^ z


(* Section 2: Polymorphic Types and Equality Types *)

fun append (xs,ys) =
   case xs of
       [] => ys
     | x::xs' => x :: append(xs',ys)

val ok1 = append(["hi","bye"],["programming","languages"])

val ok2 = append([1,2],[4,5]);

(*
val not_ok = append([1,2],["programming","languages"])
*)

(* has type ''a * ''a -> string *)
fun same_thing(x,y) = if x=y then "yes" else "no" 

(* has type int -> string *)
fun is_three x = if x=3 then "yes" else "no" 


(* Section 2: Nested Patterns *)

exception ListLengthMismatch

(* don't do this *)
fun old_zip3 (l1,l2,l3) = 
    if null l1 andalso null l2 andalso null l3
    then []
    else if null l1 orelse null l2 orelse null l3
    then raise ListLengthMismatch
    else (hd l1, hd l2, hd l3) :: old_zip3(tl l1, tl l2, tl l3)

(* don't do this *)
fun shallow_zip3 (l1,l2,l3) =
    case l1 of
	[] => 
	(case l2 of 
	     [] => (case l3 of
			[] => []
		      | _ => raise ListLengthMismatch)
	   | _ => raise ListLengthMismatch)
      | hd1::tl1 => 
	(case l2 of
	     [] => raise ListLengthMismatch
	   | hd2::tl2 => (case l3 of
			      [] => raise ListLengthMismatch
			    | hd3::tl3 => 
			      (hd1,hd2,hd3)::shallow_zip3(tl1,tl2,tl3)))

(* do this *)
fun zip3 list_triple =
    case list_triple of 
	([],[],[]) => []
      | (hd1::tl1,hd2::tl2,hd3::tl3) => (hd1,hd2,hd3)::zip3(tl1,tl2,tl3)
      | _ => raise ListLengthMismatch

(* and the inverse *)
fun unzip3 lst =
    case lst of
	[] => ([],[],[])
      | (a,b,c)::tl => let val (l1,l2,l3) = unzip3 tl
		       in
			   (a::l1,b::l2,c::l3)
		       end


(* Section 2: More Nested Patterns *)

(* another elegant use of "deep" patterns *)
fun nondecreasing xs =
    case xs of
	[] => true
      | x::[] => true
      | head::(neck::rest) => (head <= neck andalso nondecreasing (neck::rest))

(* nested pattern-matching often convenient even without recursion;
   also the wildcard pattern is good style 
   match on a pair and one or more parts of it quite useful on homework 2
*)
datatype sgn = P | N | Z

fun multsign (x1,x2) = 
  let fun sign x = if x=0 then Z else if x>0 then P else N 
  in
      case (sign x1,sign x2) of
	  (Z,_) => Z
	| (_,Z) => Z
	| (P,P) => P
	| (N,N) => P
	| _     => N (* many say bad style; I am okay with it *)
  end

(* simpler use of wildcard pattern for when you do not need the data *)

fun len xs =
    case xs of
       [] => 0
      | _::xs' => 1 + len xs'

(* *********************************************************************************
(* Section 2: *Optional*: Function Patterns *)

datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

fun old_eval e =
    case e of
        Constant i => i
      | Negate e2  => ~ (old_eval e2)
      | Add(e1,e2) => (old_eval e1) + (old_eval e2)
      | Multiply(e1,e2) => (old_eval e1) * (old_eval e2)

fun eval (Constant i) = i
  | eval (Negate e2) = ~ (eval e2)
  | eval (Add(e1,e2)) = (eval e1) + (eval e2)
  | eval (Multiply(e1,e2)) = (eval e1) * (eval e2)

fun append ([],ys) = ys
  | append (x::xs',ys) = x :: append(xs',ys)



(* Section 2: Exceptions *)

fun hd xs =
    case xs of
        []   => raise List.Empty (* All ready defined "what are others ?" *)
      | x::_ => x

exception MyUndesirableCondition

exception MyOtherException of int * int

fun mydiv (x,y) =
    if y=0
    then raise MyUndesirableCondition
    else x div y 

fun maxlist (xs,ex) = (* int list * exn -> int *)
    case xs of
        [] => raise ex
      | x::[] => x
      | x::xs' => Int.max(x,maxlist(xs',ex))

val w = maxlist ([3,4,5],MyUndesirableCondition) (* 5 *)

val x = maxlist ([3,4,5],MyUndesirableCondition) (* 5 *)
	handle MyUndesirableCondition => 42

(*val y = maxlist ([],MyUndesirableCondition)*)

val z = maxlist ([],MyUndesirableCondition) (* 42 *)
	handle MyUndesirableCondition => 42


(* Section 2: Tail Recursion *)
					     

fun fact1 n = if n=0 then 1 else n * fact1(n-1)

fun fact2 n =
    let fun aux(n,acc) = if n=0 then acc else aux(n-1,acc*n)
    in
        aux(n,1)
    end


(* Section 2: Accumulators *)

fun sum1 xs =
    case xs of
        [] => 0
      | i::xs' => i + sum1 xs'

fun sum2 xs =
    let fun f (xs,acc) =
            case xs of
                [] => acc
              | i::xs' => f(xs',i+acc)
    in
        f(xs,0)
    end

fun rev1 xs =
   case xs of
       [] => []
     | x::xs' => (rev1 xs') @ [x]

fun rev2 xs =
    let fun aux(xs,acc) =
            case xs of
                [] => acc
              | x::xs' => aux(xs', x::acc)
    in
        aux(xs,[])
    end

********************************************************************************* *)
