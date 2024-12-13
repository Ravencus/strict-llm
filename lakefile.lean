import Lake
open Lake DSL

package "mathlib" where
  version := v!"0.1.0"

lean_lib «Mathlib» where
  -- add library configuration options here

@[default_target]
lean_exe "mathlib" where
  root := `Main
