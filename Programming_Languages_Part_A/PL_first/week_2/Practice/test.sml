fun test () = 
  let

      val list = [1,2,3,4,5]
      val one = [1]
      val empty = []

      fun head (xs : int list) =
	if null xs
	then NONE 
	else SOME (hd xs)

      fun tail (xs : int list) =
	if null xs
	   orelse null (tl xs)
	then NONE
	else SOME (tl xs)

      val TESTS =
	  [
	    ( "TEST_01", head list = SOME 1 ),
	    ( "TEST_02", head one = SOME 1 ),
	    ( "TEST_03", head empty = NONE ),
	    ( "TEST_04", tail list = SOME [2,3,4,5] ),
	    ( "TEST_05", tail one = NONE ),
	    ( "TEST_06", tail empty = NONE )
	  ]

  in

    TESTS

  end

(*

- test();
val it =
  [("TEST_01",true),("TEST_02",true),("TEST_03",true),("TEST_04",true),
   ("TEST_05",true),("TEST_06",true)] : (string * bool) list

*)
