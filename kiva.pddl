(define
  (domain kiva)
  
  (:requirements
    :typing
    ;:fluents ; there is no planing using fluents(?)
    )
  
  (:types robot shelf product location picker)
  ;(:constants)
  
  (:predicates
    (at ?x ?y)
    ;"Y is at X"
    (picked ?prdct - product)
    (loaded ?rbt - robot)
    )

  (:action drive_to
    :parameters (?rbt - robot ?from - location ?goal - location)
    :precondition (at ?from ?rbt)
    :effect ( and (at ?goal ?rbt) (not (at ?from ?rbt)))
    )

  ;(:action deliver
  ;  :parameters (?rbt - robot ?prdct - product ?pckr - picker ?loc - location)
  ;  :precondition (and (at ?shlf ?prdct) (at ?loc ?pckr) (at ?loc ?pckr))
  ;  :effect (and (at ?pckr ?prdct) (not (at ?rbt ?prdct)))
  ;  )

  (:action pick
    :parameters (?pckr - picker ?shlf - shelf ?prdct - product ?loc - location ?rbt - robot)
    :precondition (and (at ?shlf ?prdct) (at ?rbt ?shlf) (at ?loc ?rbt) (at ?loc ?pckr))
    :effect (and (picked ?prdct) (not (at ?shlf ?prdct)))
    )

  (:action unload
    :parameters (?loc - location ?shlf - shelf ?rbt - robot)
    :precondition (and (at ?rbt ?shlf) (at ?loc ?rbt) (loaded ?rbt))
    :effect (and (not (at ?rbt ?shlf)) (at ?loc ?shlf) (not (loaded ?rbt)))
    )

  (:action load
    :parameters (?rbt - robot  ?shlf - shelf ?loc - location)
    :precondition (and (at ?loc ?rbt) (at ?loc ?shlf) (not (loaded ?rbt)))
    :effect ( and (not (at ?loc ?shlf)) (at ?rbt ?shlf) (loaded ?rbt))
    )

  ;(:order
  ;  :parameters ()
  ;  :precondition ()
  ;  :effect ()
  ;  )
)
