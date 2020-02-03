(define (append lst1 lst2)
    (if (null? lst1) 
        lst2
        (cons (car lst1)  
            (append (cdr lst1) lst2)))
)

(define test0 (append (list ) (list )))
(display test0) (newline)
; expected: ()

(define test1 (append (list ) (list 1)))
(display test1) (newline)
; expected: (1)

(define test2 (append (list 1) (list )))
(display test1) (newline)
; expected: (1)

(define test3 (append (list 1) (list 2)))
(display test3) (newline)
; expected: (1 2)

(define test4 (append (list 1) (list 2 3)))
(display test4) (newline)
; expected: (1 2 3)

(define test5 (append (list 1 2) (list 3 4)))
(display test5) (newline)
; expected: (1 2 3 4)

(define test6 (append (list 1 2 3) (list 4 5)))
(display test6) (newline)
; expected: (1 2 3 4 5)

(define test7 (append (list 1 2 3 4) (list 5 6)))
(display test7) (newline)
; expected: (1 2 3 4 5 6)
