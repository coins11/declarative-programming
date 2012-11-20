type figure =
    | Rectangle of float * float
    | Circle of float
    | Triangle of float * float

let draw_figure x y =
    let open Graphics in
    function
    | Rectangle (w, h) ->
        fill_rect
            (int_of_float x) (int_of_float y)
            (int_of_float w) (int_of_float h)
    | Circle r ->
        fill_circle (int_of_float x) (int_of_float y) (int_of_float r)
    | Triangle (w, h) ->
        fill_poly [|int_of_float x, int_of_float y ;
                    int_of_float x, int_of_float (y +. h);
                    int_of_float (x +. w), int_of_float y|]
    ;;

let main x y c fig =
    let open Graphics in
    let rec loop () =
        if (wait_next_event [Key_pressed]).keypressed then () else loop () in
    open_graph " 400x400" ; set_color c ; draw_figure x y fig ;
    loop () ; close_graph () ;;
