(define (domain hotel-reservas)
  (:requirements :adl :typing :fluents)
  
  (:types
    habitacion reserva dia - object
  )
  
  (:predicates
    ;; Estado de las reservas
    (asignada ?r - reserva ?h - habitacion)
    (pendiente ?r - reserva)
    (servida ?r - reserva)
    
    ;; Habitación ocupada en un día específico
    (ocupada ?h - habitacion ?d - dia)
    
    ;; Días que pertenecen a una reserva
    (dia-reserva ?r - reserva ?d - dia)
  )
  
  (:functions
    ;; Capacidad de cada habitación (número de personas que caben)
    (capacidad ?h - habitacion)
    
    ;; Número de personas en cada reserva
    (num-personas ?r - reserva)
  )
  
  (:action asignar-reserva
    :parameters (?r - reserva ?h - habitacion)
    :precondition (and 
      ;; La reserva está pendiente
      (pendiente ?r)
      
      ;; La habitación tiene capacidad suficiente
      (>= (capacidad ?h) (num-personas ?r))
      
      ;; La habitación no está ocupada en ningún día de la reserva
      (forall (?d - dia)
        (imply (dia-reserva ?r ?d)
               (not (ocupada ?h ?d))))
    )
    :effect (and
      ;; Asignar la reserva
      (asignada ?r ?h)
      (servida ?r)
      (not (pendiente ?r))
      
      ;; Marcar todos los días de la reserva como ocupados en esa habitación
      (forall (?d - dia)
        (when (dia-reserva ?r ?d)
              (ocupada ?h ?d)))
    )
  )
)