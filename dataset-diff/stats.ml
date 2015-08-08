open Core.Std

type t =
  { mutable n : int
  ; mutable x : float
  ; mutable x2 : float
  ; mutable min : float
  ; mutable max : float
  ; mutable maxmod : float
  }

let create () = { n = 0; x = 0.; x2 = 0.; min = 0.; max = 0.; maxmod = 0. }

let update s value =
  s.x <- s.x +. value;
  s.x2 <- s.x2 +. (value *. value);
  s.min <- if s.n = 0 then value else Float.min s.min value;
  s.max <- if s.n = 0 then value else Float.max s.max value;
  s.maxmod <- Float.max s.maxmod (Float.abs value);
  s.n <- s.n + 1

let n s = s.n
let x s = s.x
let x2 s = s.x2
let min s = s.min
let max s = s.max
let maxmod s = s.maxmod

let mean { n; x; _ } = x /. (Float.of_int n)
let variance s = s.x2 /. (Float.of_int s.n) -. mean s ** 2.
let stddev s = sqrt (variance s)

let string_list_row_headers = ["n"; "x"; "x2"; "min"; "max"; "maxmod"; "mean"; "variance"; "stddev"]
let to_string_list s =
  let getters = [x; x2; min; max; maxmod; mean; variance; stddev] in
  Int.to_string s.n :: List.map ~f:(fun g -> Float.to_string (g s)) getters
