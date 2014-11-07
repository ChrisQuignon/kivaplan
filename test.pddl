(define (problem test)
  (:domain kiva)
  (:requirements :typing)
  (:objects
    rbt - robot
    loc1  loc2 loc3 pckrloc - location
    pckr - picker
    prdct - product)	
  (:init(at rbt loc1) (at loc2 prdct) (at pckr pckrloc))
  (:goal 
    (and
    (picked prdct) 
    (at rbt pckrloc)
    )
    )
)
