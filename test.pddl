(define (problem test)
  (:domain kiva)
  (:objects rbt loc1 loc2 pckr prdct)	
  (:init (robot rbt) (location loc1) (location loc2) (at rbt loc1) (location pckr) (picker pckr) (product prdct) (at loc2 prdct))
  (:goal (and (picked prdct) (at rbt loc1)))
)
