
; original

; 1000          2, 2, 2
; 10000         7, 4, 3
; 100000        19, 11, 9
; 10 000 000     59, 54, 50  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; after improving:  
; 1000          2, 2, 1
; 10000         5, 5, 3
; 100000        15, 7, 5
; 1 000 000     25, 18, 15
; 10 000 000    45

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (next test-divisor)
    (cond ((= test-divisor 2) 3)
        (else (+ test-divisor 2)))
)

(define (smallest-divisor n)
  (find-divisor n 2))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 5)
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


(search-for-primes-in-range 999 1100)  
(search-for-primes-in-range 9999 10100)  
(search-for-primes-in-range 99999 100100)  
(search-for-primes-in-range 999999 1000100)  
(search-for-primes-in-range 9999999 10000200)  ;59 to 42
(search-for-primes-in-range 99999999 100000200) ;169 to 117


