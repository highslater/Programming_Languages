

fun silly3 () =
  let
      val x = (let val x = 5 in x + 10 end);
  in
      (x, let val x = 2 in x end, let val x = 10 in let val x = 2 in x end end)
  end

(*

- silly3 ();
val it = (15,2,2) : int * int * int

*)

fun letz (x : int, y : int) =
  if x mod 2 = 0
  then
      let
	  val x = 100;
      in
	  x + y
      end
  else
      x + y
