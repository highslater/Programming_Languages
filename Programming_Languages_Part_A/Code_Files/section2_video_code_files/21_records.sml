(* Programming Languages, Dan Grossman *)
(* Section 2: Records *)

val x = {bar = (1+2,true andalso true), foo = 3+4, baz = (false,9) }

val my_niece = {name = "Amelia", id = 41123 - 12}

val brain_part = {id = true, ego = false, superego = false}





		     
val roof_cut = {span = 24, pitch = 8};

val v = {5 = 1, 4 = 2, 3 = 3, 2 = 4, 1 = 5}
	    
fun rise (params) =
    (#span roof_cut * #pitch roof_cut) div (24);


fun unit_length (params) =
    let val x = real((#pitch roof_cut * #pitch roof_cut) + 144)
    in Real.toString(real(round(sqrt(x) * 100.0)) / 100.0)
    end
	
val r = rise(roof_cut) = 8;
val u = unit_length(roof_cut) = "14.42";
    
