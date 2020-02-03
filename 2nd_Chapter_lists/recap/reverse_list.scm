(define (reverse lst)
    (define (reverse_iter source dest)
        (if (null? source)
            dest
            (reverse_iter (cdr source) (cons (car source) dest))
        )
    )
    (reverse_iter lst nil)
)

(display (reverse (list 1 2 3))) (newline)
; exp: (3 2 1)

(display (reverse (list 1))) (newline)
; exp: (1)  