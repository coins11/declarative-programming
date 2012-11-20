type 'a ftree = FBr of 'a * 'a ftree list

let fpreorder t =
    let rec fprec (FBr (label, l)) r = label :: List.fold_right fprec l r in
    fprec t [];;
