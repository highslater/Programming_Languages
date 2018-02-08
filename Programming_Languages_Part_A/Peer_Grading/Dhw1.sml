fun is_older ((y1,m1,d1):int*int*int, (y2,m2,d2):int*int*int) =
    if y1<y2 then
        true
    else
        if y1=y2 then
            if m1<m2 then
                true
            else
                if m1=m2 then
                    d1<d2
                else
                    false
        else
            false

fun number_in_month (xs:(int*int*int) list, m:int) =
    let 
        fun helper (date:int*int*int) = if (#2 date) = m then 1 else 0
    in
        case xs of
            [] => 0
            | date::res => helper (date) + number_in_month (res, m)
    end

fun number_in_months (xs:(int*int*int) list, ms:int list) =
    let
        fun helper (m:int) = number_in_month (xs, m)
    in
        foldr (fn (x,y)=>x+y) 0 (map helper ms)
    end

fun dates_in_month (dates:(int*int*int) list, m:int) =
    case dates of
        [] =>[]
      | x::xs => if (#2 x) = m then
            x::dates_in_month (xs, m)
        else
            dates_in_month (xs, m)

fun dates_in_months (dates:(int*int*int) list, ms:int list) =
    let
        fun helper (m:int) = dates_in_month (dates, m)
    in
        foldr (fn (x,y)=>x@y) [] (map helper ms)
    end

fun get_nth (strs, n) =
    if n=1 then
        hd strs
    else
        get_nth (tl strs, n-1)

fun date_to_string (date:(int*int*int)) =
    let
        val year = Int.toString (#1 date)
        val month_list = ["January", "February", "March", "April",
                          "May", "June","July", "August", "September",
                          "October", "November", "December"]
        val month = get_nth (month_list, #2 date)
        val day = Int.toString (#3 date)
    in
        month ^ " " ^ day ^ ", " ^ year
    end

fun number_before_reaching_sum (n, lst) =
    if n <= (hd lst) then
        0
    else
        number_before_reaching_sum(n-(hd lst), tl lst) + 1


fun what_month d =
    1 + number_before_reaching_sum (d, [31,28,31,30,31,30,31,31,30,31,30,31])

fun month_range (x, y) =
    let
        fun range (l:int, r:int):int list =
            if l>r then
                []
            else
                l::range(l+1,r)
    in
        map (fn x => what_month x) (range (x,y))
    end

fun oldest dates =
    if dates = [] then
        NONE
    else
        let val ans = oldest (tl dates) in
            if isSome ans then
                if is_older (hd dates, valOf ans) then
                    SOME (hd dates)
                else
                    ans
            else
                SOME (hd dates)
        end