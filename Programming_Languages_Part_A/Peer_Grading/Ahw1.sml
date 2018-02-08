(* I am a comment! *)

fun is_older(first: (int * int * int), second: (int * int * int)) =
    if #1 first < #1 second
    then true
    else if #1 first > #1 second
    then false
    else if #2 first < #2 second
    then true
    else if #2 first > #2 second
    then false
    else #3 first < #3 second;

fun number_in_month(dates: (int * int * int) list, month: int) =
    if null dates
    then 0
    else if #2 (hd dates) = month
    then 1 + number_in_month(tl dates, month)
    else number_in_month(tl dates, month);

fun number_in_months(dates: (int * int * int) list, months: int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months);

fun dates_in_month(dates: (int * int * int) list, month: int) =
    if null dates
    then []
    else if #2 (hd dates) = month
    then (hd dates)::dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month);
	
fun dates_in_months(dates: (int * int * int) list, months: int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months);

fun get_nth(array: string list, index: int) =
    if index = 1
    then hd array
    else get_nth(tl array, index - 1);

fun date_to_string(date: (int * int * int)) =
    let
	val month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(month_names, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end;

fun number_before_reaching_sum(sum: int, vals: int list) =
    let
	fun summer(acc: int, index: int, vals_mod: int list) =
	    if acc + hd vals_mod >= sum
	    then index
	    else summer(acc + hd vals_mod, index + 1, tl vals_mod)
    in
	summer(0, 0, vals)
    end;

fun what_month(day_index: int) =
    let
	val month_lengths = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	1 + number_before_reaching_sum(day_index, month_lengths)
    end;

fun month_range(start: int, finish: int) =
    if start > finish
    then []
    else if start = finish
    then what_month(finish)::[]
    else what_month(start)::month_range(start+1, finish);

fun oldest(dates: (int * int * int) list) =
    if null dates
    then NONE
    else 
	let
	    fun find_oldest(current_oldest: (int * int * int), dates_mod: (int * int * int) list) =
		if null dates_mod
		then current_oldest
		else if is_older(current_oldest, hd dates_mod)
		then find_oldest(current_oldest, tl dates_mod)
		else find_oldest(hd dates_mod, tl dates_mod)
				
	in
	    SOME (find_oldest(hd dates, tl dates))
	end;
