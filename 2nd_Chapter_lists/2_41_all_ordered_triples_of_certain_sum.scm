(define (sum-filtered-triples n sum)
    (define (sum_equals_n? triple)
        (if (= (sum_triple triple) sum)
            #t
            #f)
    )
    
    (mapi make_triple_to_sum_dict
        (filter sum_equals_n?
                (unique-triples n)))
)

(define (unique-triples n)
    (flatmap 
        (lambda (i) 
                (flatmap 
                    (lambda (j) 
                        (mapi 
                            (lambda (k) (list i j k)) 
                            (enumerate-interval (+ j 1) n)))
                    (enumerate-interval (+ i 1) n)))
        (enumerate-interval 1 n))
)

(define (sum_triple triple)
    (+ (car triple) (cadr triple) (cadr (cdr triple)))
)

(define (make_triple_to_sum_dict triple)
    (list (list (car triple) (cadr triple) (cadr (cdr triple))) 
          (sum_triple triple))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (flatmap proc seq)
  (accumulate append nil (mapi proc seq)))

(define (accumulate op initial seq)
    (if (null? seq) initial 
        (op (car seq) (accumulate op initial (cdr seq))))
)

(define (mapi op seq)
    (accumulate 
        (lambda (x y) (cons (op x) y)) 
        nil 
        seq))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
    (flatmap (lambda (i) 
        (mapi 
            (lambda (j) (list j i)) (enumerate-interval (+ i 1) n))) 
            (enumerate-interval 1 n))
)

;(unique-pairs 5)

;(unique-triples 4)
;(sum_triple (list 3 7 18))
(sum-filtered-triples 3 6)