(define (problem pb1)
  (:domain kiva)
  (:requirements :typing :negative-preconditions)
  (:objects
    pckr - picker

    rbt1 rbt2 - robot
    loc1  loc2 loc3  loc4 loc5 loc6 loc7 loc8 loc9 - shelflocation
    pckrloc - pickerlocation

    prdct1 prdct2 prdct3 prdct4 prdct5 prdct6 - product
    shlf1 shlf2 shlf3 shlf4 shlf5 shlf6 shlf7 shlf8 shlf9 - shelf
  )
    
  (:init
    
    (at pckrloc rbt1)
    (at pckrloc rbt2)
    
    (at loc1 shlf1)
    (at loc2 shlf2)
    (at loc3 shlf3)
    (at loc4 shlf4)
    ;(at loc5 shlf5)
    ;(at loc6 shlf6)
    ;(at loc7 shlf7)
    ;(at loc8 shlf8)
    ;(at loc9 shlf9)
    
    (at shlf1 prdct1)
    (at shlf2 prdct2)
    (at shlf2 prdct3)
    (at shlf4 prdct4)
    
    (at pckrloc pckr) 
    
  )
    
  (:goal 
    (and
    (picked prdct1) 
    (picked prdct2) 
    (picked prdct3) 
    (picked prdct4)
    )
  )
)
