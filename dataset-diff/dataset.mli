open Core.Std

type t

val create : string -> t
val iteri2 : t -> t -> f:(int -> int -> int -> int -> int -> float -> float -> unit) -> unit
