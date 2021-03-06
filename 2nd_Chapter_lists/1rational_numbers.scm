(define (make-rat n d)
    (define (signum x)
        (cond ((= x 0) 0)
            ((< x 0) -1)
            (else 1))
    )
    (let ((npos (abs n))
            (dpos (abs d)))
    (let ((sign (signum (* n d)))
        (g (gcd npos dpos)))
        (cons (* sign (/ npos g) (/ dpos g))))))  

