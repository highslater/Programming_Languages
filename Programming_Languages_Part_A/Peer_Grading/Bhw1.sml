fun is_older (d1 : int*int*int, d2 : int*int*int) =
    let
        fun compare (v1:int, v2:int) = 
            v1 < v2
    in
        if (#1 d1) <> (#1 d2) then
            compare((#1 d1),(#1 d2))
        else if (#2 d1) <> (#2 d2) then
             compare((#2 d1),(#2 d2)) 
        else 
            compare((#3 d1),(#3 d2))
    end

fun number_in_month (ds : (int*int*int) list, m : int) =
    let
        fun in_month(d : int*int*int, m) =
            if (#2 d) = m then 1 else 0
    in
        if null ds
        then 0
        else in_month(hd(ds), m) + number_in_month(tl(ds), m)
    end

fun number_in_months (ds: (int*int*int) list, ms : int list) =
    if null ms
    then 0
    else number_in_month(ds, hd(ms)) + number_in_months(ds, tl(ms))
    
	
fun dates_in_month (ds : (int*int*int) list, m : int) =
    if null ds
    then []
    else if (#2 (hd(ds))) = m then
        hd(ds)::dates_in_month(tl(ds), m)
    else
        dates_in_month(tl(ds), m)

        
fun dates_in_months (ds : (int*int*int) list, ms : int list) =
    if null ms
    then []
    else 
        let 
            val dates =dates_in_month(ds, hd(ms))
        in
            if dates <> [] then
                dates@dates_in_months(ds, tl(ms))
            else
                dates_in_months(ds, tl(ms))
        end        


fun get_nth (ss : string list, n : int) = 
    if n > 1
    then get_nth(tl ss, n - 1)
    else hd ss


fun date_to_string (d : int*int*int) = 
    let
        val fm = ["January", "February", "March", "April",
        "May", "June", "July", "August", "September", "October", "November",
        "December"]
    in
        get_nth(fm, ((#2 d)))^" "^Int.toString(#3 d)^", "^Int.toString(#1 d)
    end
    

fun number_before_reaching_sum (sum : int, is : int list) =
    let
        fun number_before_reaching_sum (is : int list, acc : int, n : int) =
            if acc >= sum then
                n - 1 
            else
                number_before_reaching_sum(tl(is), acc + hd(is), n + 1)
    in
        number_before_reaching_sum(is, 0, 0)
    end
    


fun what_month (d : int) =
    let
        val days = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(d, days)+1
    end
    

fun month_range (d1 : int, d2 : int) =
    if d1 > d2
    then []
    else [what_month(d1)] @ month_range(d1 + 1, d2)
         


fun oldest (ds :  (int * int * int) list) =
    if null ds
    then NONE
    else let
    	fun max_nonempty (ds : (int * int * int) list) =
    		if null (tl ds)
    		then hd ds
    		else let val tl_ans = max_nonempty(tl ds)
                 in
    			 if is_older((hd ds), tl_ans)  
    			 then hd ds
    			 else tl_ans
    		     end
	in
	    SOME (max_nonempty ds)
	end