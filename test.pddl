(define (problem test)
  (:domain kiva)
  (:requirements :typing)
  (:objects
    rbt - robot
    loc1  loc2 loc3 pckrloc - location
    pckr - picker
    prdct - product
    shlf - shelf)	
  (:init(at loc1 rbt) (at loc2 shlf) (at shlf prdct) (at pckrloc pckr))
  (:goal 
    (and
    (picked prdct) 
    (at loc2 rbt)
    )
    )
)
