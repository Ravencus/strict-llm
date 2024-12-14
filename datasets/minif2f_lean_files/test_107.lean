import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat



theorem total_surface_area_of_tower : 
  /-- Seven cubes, whose volumes are $1$, $8$, $27$, $64$, $125$, $216$, and $343$ cubic units, are stacked vertically to form a tower in which the volumes of the cubes decrease from bottom to top. Except for the bottom cube, the bottom face of each cube lies completely on top of the cube below it. What is the total surface area of the tower (including the bottom) in square units?

$ \textbf{(A)}\ 644\qquad\textbf{(B)}\ 658\qquad\textbf{(C)}\ 664\qquad\textbf{(D)}\ 720\qquad\textbf{(E)}\ 749 $ Show that it is \textbf{(B) }658.-/ := by

done