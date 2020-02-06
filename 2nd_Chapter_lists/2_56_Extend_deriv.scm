; ###### Thu Feb 6 15:03:43 MSK 2020

; Show how to extend the basic differentiator to handle more kinds of expressions. For
; instance, implement the differentiation rule d(un)dx=nun−1(dudx) by adding a new clause to
; the deriv program and defining appropriate procedures exponentiation?, base, exponent, and
; make-exponentiation. (You may use the symbol ** to denote exponentiation.) Build in the
; rules that anything raised to the power 0 is 1 and anything raised to the power 1 is the
; thing itself.

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp) 
             (make-product 
                        (make-product 
                            (exponent exp)
                            (make-exponentiation (base exp) (- (exponent exp) 1))
                        )
                        (deriv (base exp) var)
                    )
        )
        (else
         (error "unknown expression type -- DERIV" exp))
    )
)

(define (exponentiation? exp)
    (and (pair? exp) (eq? (car exp) '**))
)

(define (make-exponentiation base exponent)
    (cond ((= exponent 0) 1)
        ((= exponent 1) base)
        (else (list '** base exponent))
    )
)

(define (base exponentiation)
    (cadr exponentiation)
)

(define (exponent exponentiation)
    (caddr exponentiation)
)

(deriv '(** x 2) 'x)
; output: (* 2 x)

(deriv '(** x 1) 'x)
; 1

(deriv '(** x 0) 'x)
; 0
