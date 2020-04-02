; ###### Thu Apr 2 21:40:57 MSK 2020

(define (adjoin-set x set)  
    (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))
    )
)

(adjoin-set 2 '(2))
(adjoin-set 2 '(1 2 4))
(adjoin-set 3 '(1 2 4))
(adjoin-set 3 '(4 5 6))
(adjoin-set 7 '(4 5 6))
(adjoin-set 7 '(4 5 7))
(adjoin-set 2 '())
(adjoin-set 2 (list 2 3))
(adjoin-set 2 (list 1 3))
(adjoin-set 2 (list 0 1))