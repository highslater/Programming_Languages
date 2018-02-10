(* 

8. Write a function number_before_reaching_sum that takes an int called sum, which you can
assume is positive, and an int list, which you can assume contains all positive numbers,
and returns an int. You should return an int n such that the first n elements of the list
add to less than sum, but the first n + 1 elements of the list add to sum or more. Assume
the entire list sums to more than the passed in value; it is okay for an exception to occur
if this is not the case.

val number_before_reaching_sum = fn : int * int list -> int

*)

fun number_before_reaching_sum (sum : int, xs : int list) =
    if hd xs >= sum
    then 0
    else 1 + number_before_reaching_sum (sum - (hd xs), (tl xs))





val test8 = n_sum (10, [1,2,3,4,5]) = 3



(*--------------------------------------------------------------------------------*)
