(define (problem pb1)
  (:domain kiva)
  (:requirements :typing)
  (:objects
    pckr - picker

    rbt1 rbt2 - robot
    loc1  loc2 loc3 - shelflocation
    pckrloc - pickerlocation

    prdct prdct2 - product
    shlf1 shlf2 - shelf
  )
    
  (:init
    
    (at loc1 rbt2)
    
    (at loc2 shlf1)
    (at shlf1 prdct)
    
    (at loc3 shlf2)
    (at shlf2 prdct2)
    
    (at pckrloc pckr) 
    
  )
    
  (:goal 
    (and
    (picked prdct) 
    (picked prdct2)
    (at loc2 shlf1)
    (at loc3 shlf2)
    )
  )
)
