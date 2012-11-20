let pi = 3.14159265358979;;

let draw_regular_ngon r n =
    let angle m = pi *. float_of_int m *. 2. /. float_of_int n in
    let posx m = int_of_float (float_of_int r *. cos (angle m)) in
    let posy m = int_of_float (float_of_int r *. sin (angle m)) in
    let rec ngon_rec x y m =
        if n != m then begin
            Graphics.rlineto ((posx m) - x) ((posy m) - y) ;
            ngon_rec (posx m) (posy m) (succ m)
        end in
    Graphics.rmoveto (posx (-1)) (posy (-1)) ;
    ngon_rec (posx (-1)) (posy (-1)) 0 ;;

let main x y r c n =
    let open Graphics in
    let rec loop () =
        if (wait_next_event [Key_pressed]).keypressed then () else loop () in
    open_graph " 400x400" ; set_color c ; moveto x y ;
    draw_regular_ngon r n ; loop () ; close_graph () ;;
