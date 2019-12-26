(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))  

///////////////////////////////////////

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))  


(define (fact n)
    (define (nextn n)
        (+ n 1))
    (define (termself n)
        n)
    (product termself 1 nextn n)
)  

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))  

(define (pi4th n)
    (define (next n)
        (+ n 2))
    (define (term n)
        (/ (* n (+ n 2)) (* (+ n 1) (+ n 1))))
    (product term 2 next (* 2 n))
)

(* 4 (pi4th 6))  

;;;;;;;;;;;;;;;;;;;;;;

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b)))) 

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (accumulate combiner null-value term a next b)
  (if (> a b)
    null-value
    (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
    (define null-value 1)
    (define (combiner a b) (* a b))
    (accumulate combiner null-value term a next b)
)

(define (sum term a next b)
    (define null-value 0)
    (define (combiner a b) (+ a b))
    (accumulate combiner null-value term a next b)
)  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))  


(define (accumulate combiner null-value term a next b)
    (define (accumulate-iter a result)
        (if (> a b)
            result
            (accumulate-iter (next a) (combiner (term a) result))
        )
    )
    
    (accumulate-iter a null-value)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filtered-accumulate combiner null-value term a next b filter?)
  (define (accumulate-iter a result)
        (if (> a b)
            result
            (if (filter? (term a))
                (accumulate-iter (next a) (combiner (term a) result))
                (accumulate-iter (next a) result)
            )
        )
    )
    
    (accumulate-iter a null-value)
)