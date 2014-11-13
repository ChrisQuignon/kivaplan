(define (problem pb3)
  (:domain kiva)
  (:requirements :typing :negative-preconditions)
  (:objects
    pckr - picker

    rbt1 rbt2 - robot
    loc1  loc2 loc3 - shelflocation
    pckrloc - pickerlocation

    prdct1 prdct2 prdct3 prdct4 prdct5 prdct6 - product
    shlf1 shlf2 shlf3 - shelf
  )
    
  (:init
    (at loc1 rbt1)
    
    (at loc2 rbt2)
    
    (at loc1 shlf1)
    (at shlf1 prdct1)
    (at shlf1 prdct2)
    (at shlf1 prdct3)
    
    (at loc2 shlf2)
    (at shlf2 prdct4)
    (at shlf2 prdct5)
    
    (at loc3 shlf3)
    (at shlf3 prdct6)
    
    (at pckrloc pckr) 
    
  )
    
  (:goal 
    (and
    (picked prdct1) 
    (picked prdct2) 
    (picked prdct3) 
    (picked prdct4) 
    (picked prdct5) 
    (picked prdct6)
    )
  )
)
