(define (problem test)
  (:domain kiva)
  (:requirements :typing)
  (:objects
    rbt - robot
    loc1  - location
    loc2  - location
    loc3 - location
    pckrloc - location
    pckr - picker
    prdct - product)	
  (:init(at rbt loc1) (product prdct) (at loc2 prdct) (at pckr pckrloc))
  (:goal 
    ;(and
    ;(picked prdct) 
    (at rbt pckrloc)
    ;)
    )
)
