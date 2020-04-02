; ###### Mon Mar 30 21:54:54 MSK 2020

; v1
(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) nil)
        ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set 
            (if (element-of-set? (car set2) set1) 
                set1 
                (cons (car set2) set1)) 
            (cdr set2))
        )
    )
)

(union-set '(a b c) '(e c d))

;;;;;;;;;;;;;;;;;;  

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
    (if (element-of-set? x set)
        set
        (cons x set)
    )
)  

; v2
(define (union-set set1 set2)
    (cond ((and (null? set1) (null? set2)) nil)
        ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (adjoin-set (car set2) set1) (cdr set2)))
    )
)  

; v3
(define (union-set set1 set2)
    (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (union-set (adjoin-set (car set2) set1) (cdr set2)))
    )
)

; v4
(define (union-set set1 set2)
  (if (null? set2)
      set1
      (union-set (adjoin-set (car set2) set1) (cdr set2))))  

(union-set '(a b c) '(d c e))