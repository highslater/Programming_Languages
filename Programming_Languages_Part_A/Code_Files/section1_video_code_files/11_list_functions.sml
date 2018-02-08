(* Programming Languages, Dan Grossman *)
(* Section 1: List Functions *)

(* Functions taking or producing lists *)

fun sum_list (xs : int list) =
    if null xs
    then 0
    else hd(xs) + sum_list(tl(xs))

fun countdown (x : int) =
    if x=0
    then []
    else x :: countdown(x-1)

fun append (xs : int list, ys : int list) = (* part of the course logo :) *)
    if null xs
    then ys
    else hd(xs) :: append(tl(xs), ys)

(* More functions over lists, here lists of pairs of ints *)

fun sum_pair_list (xs : (int * int) list) =
    if null xs
    then 0
    else #1 (hd(xs)) + #2 (hd(xs)) + sum_pair_list(tl(xs))

fun firsts (xs : (int * int) list) =
    if null xs
    then []
    else (#1 (hd xs))::(firsts(tl xs))

fun seconds (xs : (int * int) list) =
    if null xs
    then []
    else (#2 (hd xs))::(seconds(tl xs))



fun sum_pair_list2 (xs : (int * int) list) =
    (sum_list (firsts xs)) + (sum_list (seconds xs));


(* More functions over lists, here lists of triplets of ints *)

fun firsts2 (xs : (int * int * int) list) =
    if null xs
    then []
    else (#1 (hd xs))::(firsts2(tl xs))

fun seconds2 (xs : (int * int * int) list) =
    if null xs
    then []
    else (#2 (hd xs))::(seconds2(tl xs))

fun thirds2 (xs : (int * int * int) list) =
    if null xs
    then []
    else (#3 (hd xs))::(thirds2(tl xs))

fun sum_pair_list3 (xs : (int * int * int) list) =
    (sum_list (firsts2 xs)) + (sum_list (seconds2 xs) + (sum_list (thirds2 xs)));


(********************************************************)


fun product_list (xs : int list) =
    if null xs
    then 1
    else hd(xs) * product_list(tl(xs))


fun div_list (xs : int list) = (* handle uncaught exception Div [divide by zero] *)
    if null xs
    then 1
    else hd(xs) div div_list(tl(xs))


fun mod_list (xs : int list) = (* handle uncaught exception Div [divide by zero] *)
    if null xs
    then 1
    else hd(xs) mod mod_list(tl(xs))

fun factoral (n : int) = product_list(countdown(n));


			    
val sum_list_TEST1 = sum_list([1,2,3,4,5,6,7,8,9]) = 45;
val product_list_TEST1 = product_list([10,10,10,10,10]) = 100000;
val countdown_TEST1 = countdown(10) = [10,9,8,7,6,5,4,3,2,1];
val countdown_sum_list_TEST1 = sum_list(countdown(10)) = 55;
val append_countdown_TEST1 = append(countdown(5), countdown(10))= [5,4,3,2,1,10,9,8,7,6,5,4,3,2,1];
val thirds_TEST1 = thirds([(1,1,3), (2,2,3), (3,3,3)]) = [3,3,3];
val sum_pair_list3_TEST1 = sum_pair_list3([(1,2,3),(1,2,3),(1,2,3)]) = 18;
val factoral_TEST1 = factoral(10) = 3628800;
