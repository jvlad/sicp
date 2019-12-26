(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (primes-from-to n nmax)
    (cond ((> n nmax) #f)
		(else (timed-prime-test n)
	    (primes-from-to (+ n 2) nmax)))
)

(define (search-for-primes-in-range nmin nmax)
    (if (even? nmin) 
        (primes-from-to (+ nmin 1) nmax)
        (primes-from-to nmin nmax)
    )
)

(search-for-primes-in-range 1000 10000)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

