type figure =
    | Rectangle of float * float
    | Circle of float
    | Triangle of float * float

type region =
    | Figure of figure
    | Translation of float * float * region
    | Scale of float * region
    | Union of region * region

type picture = (Graphics.color * region) list

let draw_figure x y scale =
    let open Graphics in
    function
    | Rectangle (w, h) ->
        fill_rect
            (int_of_float x) (int_of_float y)
            (int_of_float (w *. scale)) (int_of_float (h *. scale))
    | Circle r ->
        fill_circle
            (int_of_float x) (int_of_float y) (int_of_float (r *. scale))
    | Triangle (w, h) ->
        fill_poly [|int_of_float x, int_of_float y ;
                    int_of_float x, int_of_float (y +. h *. scale);
                    int_of_float (x +. w *. scale), int_of_float y|]
    ;;

let rec draw_region x y scale = function
    | Figure f -> draw_figure x y scale f
    | Translation (tx, ty , r) ->
        draw_region (x +. tx *. scale) (y +. ty *. scale) scale r
    | Scale (s, r) -> draw_region x y (scale *. s) r
    | Union (r1, r2) ->
        draw_region x y scale r1 ; draw_region x y scale r2
    ;;

let rec draw_picture = function
    | [] -> ()
    | (c, r) :: ps ->
        draw_picture ps ; Graphics.set_color c ; draw_region 0. 0. 1. r
    ;;

let main pic =
    let open Graphics in
    let rec loop () =
        if (wait_next_event [Key_pressed]).keypressed then () else loop () in
    open_graph " 400x400" ; draw_picture pic ; loop () ; close_graph () ;;
