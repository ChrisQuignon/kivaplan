(define (problem test)
  (:domain kiva)
  (:requirements :typing)
  (:objects
    rbt - robot
    loc1  loc2 loc3 pckrloc - location
    pckr - picker
    prdct prdct2 - product
    shlf1 shlf2 - shelf)	
  (:init(at loc1 rbt) (at loc2 shlf1) (at shlf1 prdct) (at pckrloc pckr) (at loc3 shlf2) (at shlf2 prdct2) (not (loaded rbt)))
  (:goal 
    (and
    (picked prdct) 
    (picked prdct2)
    (at loc2 shlf1)
    (at loc3 shlf2)
    (at loc1 rbt)
    )
    )
)
