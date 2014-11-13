(define
  (domain kiva)
  
  ;amount of prdct
  
  (:requirements
    :typing
    
    ;:fluents ; there is no planing using fluents(?)
    :negative-preconditions
    )
  
  (:types
  robot shelf product location picker - object
  pickerlocation shelflocation - location
  )
  ;(:constants)
  
  (:predicates
    (at ?x ?y)
    ;"Y is at X"
    ;you might want to use lazy_swap
    
    (picked ?prdct - product)
    (loaded ?rbt - robot)
    (free ?loc - location)
  )

  (:action drive_to
    :parameters (?rbt - robot ?from - location ?goal - location)
    :precondition (at ?from ?rbt)
    :effect ( and (at ?goal ?rbt) (not (at ?from ?rbt)))
  )

  (:action pick
    :parameters (?pckr - picker ?shlf - shelf ?prdct - product ?loc - pickerlocation ?rbt - robot)
    :precondition (and (at ?shlf ?prdct) (at ?rbt ?shlf) (at ?loc ?rbt) (at ?loc ?pckr))
    :effect (and (picked ?prdct) (not (at ?shlf ?prdct)))
  )

  (:action unload
    :parameters (?loc - shelflocation ?shlf - shelf ?rbt - robot)
    :precondition (and (at ?rbt ?shlf) (at ?loc ?rbt) (loaded ?rbt) (free ?loc))
    :effect (and (not (at ?rbt ?shlf)) (at ?loc ?shlf) (not (loaded ?rbt)) (not (free ?loc)))
  )

  (:action load
    :parameters (?rbt - robot  ?shlf - shelf ?loc - shelflocation)
    :precondition (and (at ?loc ?rbt) (at ?loc ?shlf) (not (loaded ?rbt)))
    :effect ( and (not (at ?loc ?shlf)) (at ?rbt ?shlf) (loaded ?rbt) (free ?loc))
  )
  
  ; this is a noop making the (at ?x ?y) predicate ignorant to parameter order
  ;(:action lazy_swap
  ;  :parameters (?x ?y)
  ;  :precondition (at ?x ?y)
  ;  :effect (and (at ?y ?x) (not (at ?x ?y)))
  ;)
)
