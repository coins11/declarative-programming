let rec count_lines_ch (file : in_channel) : int =
  try
    let _ = input_line file in succ (count_lines_ch file)
  with End_of_file -> 0

let count_lines (filename : string) : int = count_lines_ch (open_in filename);;
