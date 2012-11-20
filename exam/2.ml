let rec run = function
    | [] -> []
    | x :: xs -> match run xs with
        | [] -> [[x]]
        | [] :: r -> [x] :: r
        | (h :: t) :: r when x < h -> (x :: h :: t) :: r
        | (h :: t) :: r -> [x] :: (h :: t) :: r
    ;;
