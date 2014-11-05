(define
  (domain kiva)
  
  ;(types robot picker shelf product)
  ;((:constants )
  
  (:predicates
    (at ?x ?y)
    ;(where ?rbt ?loc)
    (robot ?rbt)
    (location ?loc)
    (product ?p)
    (picker ?p)
    (picked ?prdct)
    )

  (:action drive_to
    :parameters (?rbt ?from ?goal)
    :precondition (and (robot ?rbt) (location ?from) (location ?goal) (at ?rbt ?from))
    :effect ( and (at ?rbt ?goal) (not (at ?rbt ?from)))
    )

  (:action deliver
    :parameters (?rbt ?prdct ?pckr)
    :precondition (and (robot ?rbt) (product ?prdct) (picker ?pckr) (at ?rbt ?prdct) (at ?rbt ?pckr))
    :effect (and (at ?pckr ?prdct) (not (at ?rbt ?prdct)))
    )

  (:action pick
    :parameters (?pckr ?prdct)
    :precondition (and (picker ?pckr) (product ?prdct) (at ?pckr ?prdct))
    :effect (picked ?prdct)
    )

  ;(:unload
  ;  :parameters ()
  ;  :precondition ()
  ;  :effect ()
  ;  )

  (:action load
    :parameters (?rbt ?prdct ?loc)
    :precondition (and (location ?loc) (product ?prdct) (at ?loc ?prdct) (at ?rbt ?loc))
    :effect ( and (not (at ?loc ?prdct)) (at ?rbt ?prdct))
    )

  ;(:order
  ;  :parameters ()
  ;  :precondition ()
  ;  :effect ()
  ;  )
)
