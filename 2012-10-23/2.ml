#use "1.ml"

type 'a graph = ('a * 'a) list;;

let graph1 = [("a", "b"); ("a", "c"); ("a", "d");
              ("b", "e"); ("c", "f"); ("d", "e");
              ("e", "f"); ("e", "g"); ("f", "d")];;

(* 1 *)
let nexts (type a) (v : a) (graph : a graph) : a list =
  List.map snd (List.filter (fun v' -> v = fst v') graph);;

(* 2 *)
let search (type a) (graph : a graph) (v : a) : a list =
    let module Q = Queue'(struct type t = a end) in
    let phi (q, r) n = if List.mem n r then (q, r) else (Q.enq q n, n :: r) in
    let rec sr q r ns =
        let q', r' = List.fold_left phi (q, r) ns in
        match Q.deq' q' with
            | Some (v, q'') -> sr q'' r' (nexts v graph)
            | None -> r'
        in
    sr Q.empty [] [v];;
