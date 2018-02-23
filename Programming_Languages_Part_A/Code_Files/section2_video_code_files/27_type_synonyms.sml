(* Programming Languages, Dan Grossman *)
(* Section 2: Type Synonyms *)


datatype suit = Club | Diamond | Heart | Spade
datatype rank = Jack | Queen | King | Ace | Num of int
type card = suit * rank
type name_record = { student_num : int option, 
                     first       : string, 
                     middle      : string option, 
                     last        : string }

		       
fun is_Queen_of_Spades (c : card) = 
    #1 c = Spade andalso #2 c = Queen

				    
val c1 : card = (Diamond,Ace)
val c2 : suit * rank = (Heart,Ace)
val c3 = (Spade,Ace)
val c4 : suit * rank = (Spade,Queen)


fun is_Queen_of_Spades2 (c) =
    case c of
	(Spade,Queen) => true
      | _ => false

		 
val TEST_1 = is_Queen_of_Spades c1 = false;
val TEST_2 = is_Queen_of_Spades c2 = false;
val TEST_3 = is_Queen_of_Spades c3 = false;
val TEST_4 = is_Queen_of_Spades c4 = true;
