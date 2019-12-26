(define (filter f y)
    (define (filter_worker i res)
        (if (null? i) 
            (reverse res)
            (if (f (car i))
                (filter_worker (cdr i) (cons (car i) res))
                (filter_worker (cdr i) res))))
    (filter_worker y nil)
)

(filter (lambda (x) (= x 0)) 1 7 0 6 7 0)

(define (same-parity x . y)
    (filter (lambda (a) (= (remainder (/ a 2))(remainder (/ x 2)))) 
        y))

(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7)
