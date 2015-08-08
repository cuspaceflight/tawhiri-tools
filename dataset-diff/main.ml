open Core.Std
open Textutils.Std

let main filename1 filename2 () =
  let var_stats = Array.init 3 ~f:(fun _ -> Stats.create ()) in
  let ds1 = Dataset.create filename1 in
  let ds2 = Dataset.create filename2 in
  Dataset.iteri2 ds1 ds2 ~f:(fun _ _ v _ _ a b ->
    Stats.update var_stats.(v) (a -. b)
  );
  let var_stats = Array.to_list var_stats in
  Ascii_table.simple_list_table
    ("variable" :: Stats.string_list_row_headers)
    (List.mapi var_stats ~f:(fun v s -> Int.to_string v :: Stats.to_string_list s))

let command =
  Command.basic
    ~summary:"Compute the l1 and l2 metrics (and some others)"
    Command.Spec.(
      empty
      +> anon ("dataset1" %: file)
      +> anon ("dataset2" %: file)
    )
    main

let () = Command.run command
