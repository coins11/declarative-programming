let rec count_lines_ch (file : in_channel) : int =
  try
    input_line file;
    succ (count_lines_ch file)
  with End_of_file -> 0

let count_lines (filename : string) : int =
  let file = open_in filename in
  let r = count_lines_ch file in
  close_in file ; r
