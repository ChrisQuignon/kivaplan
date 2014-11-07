(define
  (domain kiva)
  
  (:requirements :typing)
  
  (:types robot shelf product location 
  picker
  )
  ;((:constants )
  
  (:predicates
    (at ?x ?y)
    (picked ?prdct - product)
    )

  (:action drive_to
    :parameters (?rbt - robot ?from - location ?goal - location)
    :precondition (at ?rbt ?from)
    :effect ( and (at ?rbt ?goal) (not (at ?rbt ?from)))
    )

  (:action deliver
    :parameters (?rbt - robot ?prdct - product ?pckr - picker ?loc - location)
    :precondition (and (at ?rbt ?prdct) (at ?pckr ?loc) (at ?rbt ?loc))
    :effect (and (at ?pckr ?prdct) (not (at ?rbt ?prdct)))
    )

  (:action pick
    :parameters (?pckr - picker ?prdct - product)
    :precondition (at ?pckr ?prdct)
    :effect (picked ?prdct)
    )

  ;(:unload
  ;  :parameters ()
  ;  :precondition ()
  ;  :effect ()
  ;  )

  (:action load
    :parameters (?rbt - robot  ?prdct - product ?loc - location)
    :precondition (at ?rbt ?loc)
    :effect ( and (not (at ?loc ?prdct)) (at ?rbt ?prdct))
    )

  ;(:order
  ;  :parameters ()
  ;  :precondition ()
  ;  :effect ()
  ;  )
)
