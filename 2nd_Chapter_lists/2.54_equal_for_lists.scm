(define (equal_lst? lst1 lst2)
    (if (and (pair? lst1) (pair? lst2))
        (and (equal_lst? (car lst1) (car lst2)) 
             (equal_lst? (cdr lst1) (cdr lst2)))
        (eq? lst1 lst2)
    )
)

(display (equal_lst? 2 '(a b))) (newline)
; exp: false

(display (equal_lst? '(this is a list) '(this is a list))) (newline)
; exp: true

(display (equal_lst? '(this is a list) '(this (is a) list))) (newline)
; exp: false

(display (equal_lst? '() '())) (newline)
; exp: true

(display (equal_lst? 2 2)) (newline)
; exp: true

(display (equal_lst? 2 0)) (newline)
; exp: false

