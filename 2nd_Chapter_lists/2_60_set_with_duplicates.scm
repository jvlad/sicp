; ###### Thu Apr 2 21:05:33 MSK 2020

; O(size(set))
(define (element-of-set? x set)
    (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set))))
)

; O(size(set))
; (define (adjoin-set x set)
;   (if (element-of-set? x set)
;       set
;       (cons x set)))

; O(1)
(define (adjoin-set x set)
    (cons x set)
)

; O(size(set2)*size(set1))
; (define (union-set set1 set2)
;   (if (null? set2)
;       set1
;       (union-set (adjoin-set (car set2) set1) (cdr set2))))  

; O(size(set1))
(define (union-set set1 set2)
    (append set1 set2)
)

; O(size(set1)*size(set2))
(define (intersection-set set1 set2)
    (cond 
        ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2)
            (cons (car set1)
                (intersection-set (cdr set1) set2)
            )
        )
        (else (intersection-set (cdr set1) set2))
    )
)
