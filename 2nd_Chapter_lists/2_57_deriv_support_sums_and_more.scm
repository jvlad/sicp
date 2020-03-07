; ###### Thu Feb 6 15:43:14 MSK 2020

; Extend the differentiation program to handle sums and products of arbitrary numbers of (two
; or more) terms. Then the last example above could be expressed as (deriv '(* x y (+ x 3))
; 'x) Try to do this by changing only the representation for sums and products, without
; changing the deriv procedure at all. For example, the addend of a sum would be the first
; term, and the augend would be the sum of the rest of the terms.  

; (define (make-sum a1 a2)
;   (cond ((=number? a1 0) a2)
;         ((=number? a2 0) a1)
;         ((and (number? a1) (number? a2)) (+ a1 a2))
;         (else (list '+ a1 a2))))

(deriv '(* x y (+ x 3)) 'x)
(deriv '(+ x y z) 'x)
(deriv '(* x 1) 'x)


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
                        ; x 
                         (deriv (multiplicand exp) var))
                            ; (deriv y var))
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

(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence)
            (accumulate op initial (cdr sequence))
        )
    )
)

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (make-sum a1 . a2)
    (define (make-sum-inner a1 a2)
        (cond ((=number? a1 0) a2)
                ((=number? a2 0) a1)
                ((and (number? a1) (number? a2)) (+ a1 a2))
                (else (list '+ a1 a2))))
    (accumulate make-sum-inner a1 a2)
)

(make-sum 1 2)  

; Solution  
(define (multiplicand p) 
    (cons '* (cddr p))
)

(define (augend p)
    (cons '+ (cddr p))
)

