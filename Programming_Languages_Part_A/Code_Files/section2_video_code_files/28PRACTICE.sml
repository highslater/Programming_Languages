

datatype exp = Constant of int 
             | Negate of exp 
             | Add of exp * exp
             | Multiply of exp * exp

				     

fun max_constant (e) = (* to compute the max_constant of an e *)	    
    case e of          (* pattern match on e *)	    
	Constant i   => i
                       (* if it's a constant just return it *)		
      | Negate(e2)   => max_constant(e2)
                       (* recursivly compute e2 *)	 
      | Add(e1, e2)  => Int.max( max_constant(e1), max_constant(e2))
                       (* compute the max of the maximum constant of e1 and e2 *)
      | Multiply(e1, e2) => Int.max( max_constant(e1), max_constant(e2))
                       (* compute the max of the maximum constant of e1 and e2 *)
				   

val test_exp = Add (Constant 19, Negate (Constant 4))
val test_exp2 = Add (Negate (Constant 5), Negate (Constant 4))
		    
val nineteen = max_constant test_exp
val five = max_constant test_exp2

			    
