;;;

(define (accumulate combiner null-value term a next b)
    (if (> a b) 
        null-value
        (combiner (term a) (accumulate combiner null-value term (next a) next b)))
)

(define (accumulate combiner null-value term a next b)
    (define (accumulate-iter current-item result)
        (if (> a b) 
            result
            (accumulate-iter (next current-item) (combiner (term current-item) result))
    )
    (accumulate-iter a null-value)
)
