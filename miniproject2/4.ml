let rec sierpinski x y s = function
    | 0 -> Graphics.fill_poly
        [|int_of_float x, int_of_float y ;
          int_of_float x, int_of_float (y +. s);
          int_of_float (x +. s), int_of_float y|]
    | n ->
        sierpinski x y (s /. 2.) (n - 1) ;
        sierpinski (x +. s /. 2.) y (s /. 2.) (n - 1) ;
        sierpinski x (y +. s /. 2.) (s /. 2.) (n - 1)
    ;;

let main x y c n =
    let open Graphics in
    let rec loop () =
        if (wait_next_event [Key_pressed]).keypressed then () else loop () in
    open_graph " 400x400" ; set_color c ; sierpinski x y 100. n ;
    loop () ; close_graph () ;;
