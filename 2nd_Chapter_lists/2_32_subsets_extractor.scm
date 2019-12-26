(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest 
            (map (lambda (subset)
                    (cons (car s) subset)) 
                rest)
            ))))

(subsets (list 1))

; Tests 

;;;;
(subsets (list 1))
(let ((rest (subsets (cdr s))))
    (subsets (cdr s))
        ()
rests == (())
(append rest 
    (1)
    (() (1))

;;;
(subsets (list 2 1))
    (let ((rest (subsets (cdr s))))
        rest (subsets (1))
        (() (1))
        (append (() (1)) 
            map ((2) (2 1))
        (() (1) (2) (2 1))