type primop = PLUSop | MULop;;

type exp =
  | INTexp of int 
  | FLOATexp of float
  | VARexp of string
  | LETexp of string * exp * exp
  | PRIMexp of primop * exp * exp;;

(* 1 *)
let rec exp2string (level : int) : exp -> string =
  let bracket b s = if b then s else "(" ^ s ^ ")" in
  let primop2string = function PLUSop -> "+" | MULop -> "*" in
  let primop2level = function PLUSop -> 2 | MULop -> 1 in
  function
    | INTexp n -> string_of_int n
    | FLOATexp f -> string_of_float f
    | VARexp var -> var
    | LETexp (var, e1, e2) -> bracket (3 <= level)
      ("let " ^ var ^ "=" ^ exp2string 2 e1 ^ " in " ^ exp2string 3 e2)
    | PRIMexp (op, e1, e2) ->
      let level' = primop2level op in
        bracket (level' <= level)
        (exp2string level' e1 ^ primop2string op ^
         exp2string (pred level') e2)
  ;;

(* 2 *)
exception LookupFailed;;

let lookup (type a) (type b) (xs : (a * b) list) (key : a) : b =
  let rec lurec : (a * b) list -> b =
    function
      | [] -> raise LookupFailed
      | (f, s) :: xs' -> if f = key then s else lurec xs' in
  lurec xs;;

(* 3 *)
type value = INTval of int | FLOATval of float;;

let rec eval (env : (string * value) list) : exp -> value =
  let action_of_op =
    function
      | PLUSop -> (+), (+.)
      | MULop -> ( * ), ( *. ) in
  function
    | INTexp n -> INTval n
    | FLOATexp f -> FLOATval f
    | VARexp var -> lookup env var
    | LETexp (var, e1, e2) -> eval ((var, eval env e1) :: env) e2
    | PRIMexp (op, e1, e2) ->
      begin match eval env e1 with
        | INTval n1 ->
          begin match eval env e2 with
            | INTval n2 -> INTval (fst (action_of_op op) n1 n2)
            | FLOATval f2 ->
              FLOATval (snd (action_of_op op) (float_of_int n1) f2)
          end
        | FLOATval f1 -> FLOATval (snd (action_of_op op) f1
          (match eval env e2 with
            | INTval n2 -> float_of_int n2
            | FLOATval f2 -> f2))
      end;;
