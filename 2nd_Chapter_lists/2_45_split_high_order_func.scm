; right-split and up-split can be expressed as instances of a general splitting operation.
; Define a procedure split with the property that evaluating right-split and up-split

; 1st take
(define (split outer_split inner_split)
    (lambda (painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split outer_split inner_split) painter (- n 1))))
                (outer_split painter (inner_split smaller smaller)))
        )
    )
)

; 2nd take
(define (split outer_split inner_split)
    (define (split_result painter n)
        (if (= n 0)
            painter
            (let ((smaller ((split outer_split inner_split) painter (- n 1))))
                (outer_split painter (inner_split smaller smaller)))
        )
    )
    split_result
)

; 3rd take
(define (split outer_split inner_split)
    (define (split_result painter n)
        (if (= n 0)
            painter
            (let ((smaller (split_result painter (- n 1))))
                (outer_split painter (inner_split smaller smaller)))
        )
    )
    split_result
)

(define right-split (split beside below))
(define up-split (split below beside))  


; example of another structure
(define (create-op2 op)
    (define (create-op3 op)
        (create-op3 op)
    )
    create-op3
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Test
(define (create-op op)
  (lambda (x)
    (if (= x 0)
        (display "it works")
        (let ((smaller ((create-op op) (- x 1))))
            (op smaller)
        ))
    )
)
((create-op (lambda (x) x)) 2)
; works
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (up-split painter n)
    (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))
    )
)

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))