(* Programming Languages, Dan Grossman *)
(* Section 1: simple functions *)

(* this function correct only for y >= 0 *)
fun pow (x:int, y:int) = if y=0 then 1 else x * pow(x,y-1)

fun cube (x:int) =
    pow(x,3)

val sixtyfour = cube(4);

val fortytwo = pow(2,pow(2,2)) + pow(pow(2,2),2) + cube(2) + 2;

fun sumInts (x : int) =
    if x = 0 then 0 else x + sumInts(x - 1);

fun sumEvenInts (x : int) =
    if x = 0 then 0 else
    if x mod 2 = 0 then x + sumEvenInts(x - 1) else sumEvenInts(x - 1)

fun sumOddInts (x : int) =
    if x = 0 then 0 else
    if x mod 2 = 1 then x + sumOddInts(x - 1) else sumOddInts(x - 1)

fun sumIntsAgain (x : int) =
    sumEvenInts(x) + sumOddInts(x);

fun checkSumInts (x : int) =
    (sumInts(x),sumEvenInts(x),sumOddInts(x),sumInts(x) = sumIntsAgain(x))


