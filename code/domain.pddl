(define (domain hotel-reservations)
    (:requirements :strips :typing :fluents :negative-preconditions)
    
    (:types
        habitacio reserva dia orientacio - object
    )
    
    (:predicates
        ;; Predicats per habitacions
        (habitacio-lliure ?h - habitacio ?d - dia)
        (te-orientacio ?h - habitacio ?o - orientacio)
        
        ;; Predicats per reserves
        (reserva-assignada ?r - reserva)
        (reserva-en-habitacio ?r - reserva ?h - habitacio)
        (prefereix-orientacio ?r - reserva ?o - orientacio)
        
        ;; Predicats per dies
        (dia-reserva ?r - reserva ?d - dia)
        (seguent ?d1 - dia ?d2 - dia)
        
        ;; Control d'habitacions obertes
        (habitacio-oberta ?h - habitacio)
    )
    
    (:functions
        ;; Capacitats
        (capacitat-habitacio ?h - habitacio)
        (persones-reserva ?r - reserva)
        
        ;; Mètriques d'optimització
        (reserves-assignades) ;; Maximitzar
        (orientacions-correctes) ;; Maximitzar
        (desperdici-total) ;; Minimitzar
        (habitacions-obertes-total) ;; Minimitzar
        
        ;; Constants per ponderar
        (pes-reserves) ;; Pes més alt
        (pes-habitacions) ;; Pes alt
        (pes-desperdici) ;; Pes mitjà
        (pes-orientacio) ;; Pes baix
    )
    
    ;; Assignar una reserva a una habitació
    (:action assignar-reserva
        :parameters (?r - reserva ?h - habitacio)
        :precondition (and
            ;; La reserva no està assignada
            (not (reserva-assignada ?r))
            
            ;; Hi ha prou capacitat
            (>= (capacitat-habitacio ?h) (persones-reserva ?r))
            
            ;; Tots els dies de la reserva estan lliures
            (forall (?d - dia)
                (imply (dia-reserva ?r ?d)
                       (habitacio-lliure ?h ?d)))
        )
        :effect (and
            ;; Marcar la reserva com assignada
            (reserva-assignada ?r)
            (reserva-en-habitacio ?r ?h)
            
            ;; Ocupar els dies de l'habitació
            (forall (?d - dia)
                (when (dia-reserva ?r ?d)
                      (not (habitacio-lliure ?h ?d))))
            
            ;; Obrir l'habitació si no estava oberta
            (when (not (habitacio-oberta ?h))
                  (and (habitacio-oberta ?h)
                       (increase (habitacions-obertes-total) 1)))
            
            ;; Incrementar reserves assignades
            (increase (reserves-assignades) 1)
            
            ;; Calcular desperdici de places
            (increase (desperdici-total) 
                     (- (capacitat-habitacio ?h) (persones-reserva ?r)))
            
            ;; Comprovar si l'orientació és correcta
            (forall (?o - orientacio)
                (when (and (prefereix-orientacio ?r ?o)
                          (te-orientacio ?h ?o))
                      (increase (orientacions-correctes) 1)))
        )
    )
)
