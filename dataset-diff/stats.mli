open Core.Std

type t

val create : unit -> t
val update : t -> float -> unit

val n : t -> int
val x : t -> float
val x2 : t -> float
val min : t -> float
val max : t -> float
val maxmod : t -> float

val mean : t -> float
val variance : t -> float
val stddev : t -> float

val string_list_row_headers : string list
val to_string_list : t -> string list
