open Core.Std

type t = (float, Bigarray.float32_elt, Bigarray.c_layout) Bigarray.Array1.t

let shape = (65, 47, 3, 361, 720)
let shape_arr =
  let (a, b, c, d, e) = shape in
  [|a; b; c; d; e|]
let len =
  let (a, b, c, d, e) = shape in
  a * b * c * d * e

let create filename =
  let module BA = Bigarray in
  Unix.with_file filename ~mode:[Unix.O_RDONLY] ~f:(fun fd ->
    BA.Array1.map_file fd BA.float32 BA.c_layout false len
  )

let iteri2 ds1 ds2 ~f =
  let a, b, c, d, e = shape in
  for i = 0 to a - 1 do
    for j = 0 to b - 1 do
      for k = 0 to c - 1 do
        for l = 0 to d - 1 do
          for m = 0 to e - 1 do
            let idx = m + e * (l + d * (k + c * (j + b * i))) in
            f i j k l m (Bigarray.Array1.get ds1 idx) (Bigarray.Array1.get ds2 idx)
          done
        done
      done
    done
  done
