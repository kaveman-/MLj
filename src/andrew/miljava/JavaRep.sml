(*......................................................................*)
(* MLj - a Standard ML to Java bytecode compiler                        *)
(* Copyright (C) 1999 Persimmon IT Inc.                                 *)
(*                                                                      *)
(* This program is free software; you can redistribute it and/or        *)
(* modify it under the terms of the GNU General Public License          *)
(* as published by the Free Software Foundation; either version 2       *)
(* of the License, or (at your option) any later version.               *)
(*                                                                      *)
(* This program is distributed in the hope that it will be useful,      *)
(* but WITHOUT ANY WARRANTY; without even the implied warranty of       *)
(* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the        *)
(* GNU General Public License for more details.                         *)
(*                                                                      *)
(* You should have received a copy of the GNU General Public License    *)
(* along with this program; if not, write to the Free Software          *)
(* Foundation, Inc., 59 Temple Place - Suite 330, Boston,               *)
(* MA 02111-1307, USA.                                                  *)
(*......................................................................*)

(*======================================================================*)
(* MIL type representation in Java.                                     *)
(* Aim: to capture all use we make of Java types, including choices not *)
(* directly reflected in MIL (e.g. subclasses for closures and          *)
(* constructors, classes for boxed primitive types).                    *)
(*======================================================================*)
structure JavaRep =
struct

(*----------------------------------------------------------------------*)
(* Representation of MIL types in Java.                          	*)
(*----------------------------------------------------------------------*)
datatype Rep =
  Object                  (* class java/lang/Object *)
| Java of Types.base_type (* Java base types *)
| Prod of int             (* i'th product class; also for refs *)
| Array of Rep            (* Java arrays *)
| Con of int option       (* SOME i: i'th constructor class; NONE: "S" *)
| Exn of int option       (* SOME i: i'th ML exception class; NONE: "E" *)
| Closure of int option   (* SOME i: i'th closure class; NONE: "F" *)
| Class of int            (* i'th non-exported class type *)
| RepRef of Rep option ref(* Hack for recursive reps *)

end
