(* #1 *)
fun is_older(d1 : int*int*int, d2 : int*int*int) =
    if #1 d1 = #1 d2
        then if #2 d1 = #2 d2
                then #3 d1 < #3 d2
    	       else #2 d1 < #2 d2
        else #1 d1 < #1 d2

(* #2 *)
fun number_in_month(dates : (int*int*int) list, month : int) =
    if null dates
        then 0
        else
        	let val inMonth = if #2 (hd dates) = month then 1 else 0
        	in
        	    inMonth + number_in_month(tl dates, month)
        	end

(* #3 *)
fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null months
        then 0
        else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* #4 *)
fun dates_in_month(dates : (int*int*int) list, month : int) =
    if null dates
        then []
        else
        	let
        	    val cur_date = hd dates
        	in
        	    if #2 (cur_date) = month
            	    then cur_date::dates_in_month(tl dates, month)
            	    else dates_in_month(tl dates, month)
        	end

(* #5 *)
fun dates_in_months(dates : (int*int*int) list, months : int list) =
    if null months
        then []
        else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* #6 *)
fun get_nth(strs : string list, n : int) =
    if n = 1
        then hd strs
        else get_nth(tl strs, n - 1)

(* #7 *)
fun date_to_string(date : int*int*int) =
    let
        val months = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
        get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

(* #8 *)
fun number_before_reaching_sum(sum : int, lst : int list) =
    if sum <= hd lst
        then 0
        else 1 + number_before_reaching_sum(sum - (hd lst), tl lst)

(* #9 *)
fun what_month(day : int) =
    let
        val days_in_each_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
        1 + number_before_reaching_sum(day, days_in_each_month)
    end

(* #10 *)
fun month_range(day1 : int, day2 : int) =
    if day1 > day2
        then []
        else what_month(day1)::month_range(day1 + 1, day2)

(* #11 *)
fun oldest(dates : (int*int*int) list) =
    if null dates
        then NONE
        else
        	let
        	    val res = oldest(tl dates)
                in
        	    if isSome res andalso is_older(valOf res, hd dates)
        	       then res
        	       else SOME (hd dates)
        	end

(* Challenge problems *)
(* #12 *)
(* guaranteed at least 1 element *)
fun remove_dups(lst : int list) =
    let fun scan(sublist : int list) =
        if null sublist
            then 0
            else (if hd sublist = hd lst then 1 else 0) + scan(tl sublist)
    in
        if null (tl lst) (* do we have at least 2 elements? *)
            then [hd lst]
        else if scan(lst) > 1
            then remove_dups(tl lst)
            else (hd lst)::remove_dups(tl lst)
    end

fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else
        let
            val rMonths = months (* remove_dups(months) - removed b/c autograder was timing out *)
        in
            number_in_month(dates, hd rMonths) + number_in_months(dates, tl rMonths)
        end

fun dates_in_months_challenge(dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else
        let
            val rMonths = months (*remove_dups(months) - removed b/c autograder was timing out *)
        in
            dates_in_month(dates, hd rMonths) @ dates_in_months(dates, tl rMonths)
        end

(* #13 *)
fun reasonable_date(date : int*int*int) =
    let
        val year = #1 date
        val month = #2 date
        val day = #3 date
        val is_leap_year = (year mod 4 = 0) andalso not ((year mod 100 = 0) andalso not (year mod 400 = 0))
        val days_in_each_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        fun get_nth_month(n : int, months : int list) =
            if n = 1
                then hd months
                else get_nth_month(n - 1, tl months)
    in
        if (year > 0) andalso (month = 2) andalso (day > 0) (* let's handle February shall we? *)
            then
                if is_leap_year
                    then day < 30
                    else day < 29
            else (year > 0) andalso (month > 0) andalso (month <= 12) andalso (day > 0) andalso (day < get_nth_month(month, days_in_each_month))
    end
