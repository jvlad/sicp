
(define (for-each proc lst)
    (define (apply_and_move_to_next list) 
        (proc (car list))
        (for-each proc (cdr list)))
    (if (null? lst)
        true
        (apply_and_move_to_next lst))
)  

