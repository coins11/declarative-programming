module type ElemType = sig
    type t
end

module Queue (Elem : ElemType) = struct
    type t = Elem.t list * Elem.t list;;
    let empty : t = ([], []);;
    let norm (l1, l2) : t =
        match l1 with
            | [] -> (List.rev l2, [])
            | _ -> (l1, l2);;
    let enq (l1, l2) x : t = norm (l1, x :: l2);;
    let null q =
        match q with
            | ([], []) -> true
            | _ -> false;;
    let deq' (l1, l2) =
        match l1 with
            | x :: l1' -> Some (x, norm (l1', l2))
            | _ -> None;;
    let deq q =
        match deq' q with
            | Some r -> r
            | None -> raise (Failure "deq");;
end

module Queue' (Elem : ElemType) = struct
    module Base = Queue(Elem);;
    include Base;;
    let enqlist (q : t) : Elem.t list -> t =
        List.fold_left enq q;;
    let rec print_queue (p : Elem.t -> unit) (q : t) : unit =
        match deq' q with
            | Some (x, q') -> p x ; print_queue p q'
            | None -> ();;
end

module IntQueue = Queue' (struct type t = int end);;

let print_int_queue =
    IntQueue.print_queue (fun n -> print_int n ; print_newline ());;
