(* 1 *)
type figure =
  | Circle of float
  | Square of float
  | Rectangle of float * float;;

(* 2 *)
let pi = 3.141592653589793;;
let area : figure -> float =
  function
    | Circle a -> a *. a *. pi
    | Square a -> a *. a
    | Rectangle (a, b) -> a *. b
  ;;
