type primop = PLUSop | MINUSop;;

type exp =
  | INTexp of int 
  | VARexp of string
  | FNexp of string * exp
  | PRIMexp of primop * exp * exp
  | IFZEROexp of exp * exp * exp
  | APPexp of exp * exp;;

type value =
  | INTval of int
  | CLOSUREval of string * exp * (string * value) list;;

exception Type_mismatch of (string * string);;

let lookup (type a) (type b) (xs : (a * b) list) (key : a) : b =
  let rec lurec : (a * b) list -> b =
    function
      | [] -> raise Not_found
      | (f, s) :: xs' -> if f = key then s else lurec xs' in
  lurec xs;;

let rec exp2string (level : int) : exp -> string =
  let bracket b s = if b then s else "(" ^ s ^ ")" in
  let primop2string = function PLUSop -> "+" | MINUSop -> "-" in
  function
    | INTexp n -> string_of_int n
    | VARexp var -> var
    | FNexp (var, e) ->
      bracket (3 <= level) ("\\" ^ var ^ " -> " ^ exp2string 3 e)
    | PRIMexp (op, e1, e2) -> bracket (2 <= level)
      (exp2string 2 e1 ^ " " ^ primop2string op ^ " " ^ exp2string 1 e2)
    | IFZEROexp (e1, e2, e3) -> bracket (3 <= level)
      ("if0 " ^ exp2string 0 e1 ^ " " ^ exp2string 0 e2 ^ " " ^ exp2string 0 e3)
    | APPexp (e1, e2) -> bracket (1 <= level)
      (exp2string 1 e1 ^ " " ^ exp2string 0 e2)
  ;;

let rec eval (ctx : (string * value) list) : exp -> value =
  function
    | INTexp n -> INTval n
    | VARexp var -> lookup ctx var
    | FNexp (var, e) -> CLOSUREval (var, e, ctx)
    | PRIMexp (op, e1, e2) ->
      begin match eval ctx e1 with
        | INTval n ->
          begin match eval ctx e2 with
            | INTval m ->
              INTval begin match op with
                | PLUSop -> n + m
                | MINUSop -> n - m
              end
            | _ -> raise (Type_mismatch ("int", "closure"))
          end
        | _ -> raise (Type_mismatch ("int", "closure"))
      end
    | IFZEROexp (e1, e2, e3) ->
      begin match eval ctx e1 with
        | INTval n -> eval ctx (if n = 0 then e2 else e3)
        | _ -> raise (Type_mismatch ("int", "closure"))
      end
    | APPexp (e1, e2) ->
      begin match eval ctx e1 with
        | CLOSUREval (var, e1', ctx') ->
          eval ((var, eval ctx e2) :: ctx') e1'
        | _ -> raise (Type_mismatch ("int", "closure"))
      end;;
