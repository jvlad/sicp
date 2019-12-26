(define (fib a)
    (cond ((= a 0) 0)
        ((= a 1) 1)
    (else (+ (fib (- a 1)) (fib (- a 2)))))
)

(fib 4)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (fib a)
    (cond 
      ((= a 0) 0)
      (else (fib-iter 1 0 (- a 1)))
    )
)

(define (fib-iter a b count)
    (cond 
      ((= count 0) a)
      (else (fib-iter (+ a b) a (- count 1)))
    )
)

(fib 0)
