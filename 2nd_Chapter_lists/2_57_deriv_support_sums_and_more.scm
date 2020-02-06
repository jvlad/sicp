; ###### Thu Feb 6 15:43:14 MSK 2020

; Extend the differentiation program to handle sums and products of arbitrary numbers of (two
; or more) terms. Then the last example above could be expressed as (deriv '(* x y (+ x 3))
; 'x) Try to do this by changing only the representation for sums and products, without
; changing the deriv procedure at all. For example, the addend of a sum would be the first
; term, and the augend would be the sum of the rest of the terms.  

(define (make-sum a1 a2) (list '+ a1 a2))

(define (make-product m1 m2) (list '* m1 m2))
