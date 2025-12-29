(define (domain hotel-reserves)
  (:requirements :adl :typing :fluents :quantified-preconditions)
  
  (:types
    habitacio reserva dia - object
  )
  
  (:predicates
    ;; Estat de les reserves
    (pendent ?r - reserva)
    (servida ?r - reserva)
    (assignada ?r - reserva ?h - habitacio)
    
    ;; Habitació ocupada un dia
    (ocupada ?h - habitacio ?d - dia)
    
    ;; Dies que pertanyen a una reserva
    (dia-reserva ?r - reserva ?d - dia)

    ;; Predicats per les orientacions
    (te-orientacio ?h - habitacio ?o - orientacio)
    (prefereix-orientacio ?r - reserva ?o - orientacio)
  )
  
  (:functions
    ;; Capacitat de cada habitació
    (capacitat ?h - habitacio)
    
    ;; Número de persones a cada reserva
    (num-persones ?r - reserva)
    
    ;; Contadors per optimització
    (reserves-assignades)
    (orientacions-incorrectes)
  )
  
  ;; Assignar una reserva a una habitació
  (:action assignar-reserva
    :parameters (?r - reserva ?h - habitacio)
    :precondition (and 
      ;; La reserva està pendent
      (pendent ?r)
      
      ;; L'habitació té capacitat suficient
      (>= (capacitat ?h) (num-persones ?r))
      
      ;; L'habitació no està ocupada cap dia de la reserva
      (forall (?d - dia)
        (imply (dia-reserva ?r ?d)
               (not (ocupada ?h ?d))))
    )
    :effect (and
      ;; Assignar la reserva
      (assignada ?r ?h)
      (servida ?r)
      (not (pendent ?r))

      ;; Marcar tots els dies de la reserva com ocupats
      (forall (?d - dia)
        (when (dia-reserva ?r ?d)
              (ocupada ?h ?d)))

      ;; Incrementar el cost si la orientació de la reserva i l'habitació no coincideix
      (forall (?o - orientacio)
        (when (and (te-orientacio ?h ?o) (not (prefereix-orientacio ?r ?o)))
                (increase (orientacions-incorrectes) 1)))
    )
  )

  ;; Acció per deixar una reserva sense assignar
  (:action descartar-reserva
    :parameters (?r - reserva)
    :precondition (pendent ?r)
    :effect (and
      ;; No marquem com servida, simplement la treiem de pendents
      (not (pendent ?r))
      (increase (reserves-assignades) 1)
    )
  )
)
