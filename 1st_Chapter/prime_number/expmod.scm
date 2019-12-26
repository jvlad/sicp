(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))


;;;;;;;;;;;;;;;;;;;;;;;;;

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (* (expmod base (/ exp 2) m)
                       (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))  


;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (simpson f a b n)
    (define h
        (/ (- b a) n))
    (define (y k)
        (f (+ a (* k h))))
    (define (term4 k)
        (* 4 (y k)))
    (define (term2 k)
        (* 2 (y k)))
    (define (nextk k)
        (+ k 2))
  (* (/ h 3)
    (+ (sum term2 2 nextk (- n 2))
        (sum term4 1 nextk (- n 1))
        (f a) 
        (f b)
        )))

(define (simpson f a b n)
    (define h
        (/ (- b a) n))
    (define (y k)
        (f (+ a (* k h))))
    (define (term4 k)
        (* 4 (y k)))
    (define (term2 k)
        (* 2 (y k)))
    (define (nextk k)
        (+ k 2))
  (* (/ h 3)
    (+ (sum term2 a next b)
        (sum term4 a next b)
        (f a) 
        (f b)
        )))