(define (reverse l)
    (define (reverse_iter original_list reversed_list)
        (if (null? (cdr original_list))
            (cons (car original_list) reversed_list)
            (reverse_iter (cdr original_list) (cons (car original_list) reversed_list))
        )
    )
    (if (null? l) nil
        (reverse_iter l nil)
    )
)  

; ((1 2))
; expected: ((2 1))

((1 2))
(1 2), nil
.
reverse_iter (2), (1)
reverse_if_list 2
cons 2 (1) -> (2 1)
cons (2 1) nil -> ((2 1))

;((1 2) 3)
; exp: (3 (2 1))
; .
; reverse_iter ((1 2) 3), nil
; reverse_iter (3), ((1 2))
; (3 (1 2))

;((1 2) 3)
; exp: (3 (2 1))

reverse_iter ((1 2) 3), nil
reverse_iter (3), ((2 1))
    reverse (1 2)
        reverse_iter (1 2) nil
            reverse_iter (2) (1)
                (2 1)
    (3 (2 1))

(3 (2 1))


(define (reverse l)
    (define (reverse_if_list item)
        (if (pair? item)
            (reverse item)
            item)
    )
    (define (reverse_iter original_list reversed_list)
        (if (null? (cdr original_list))
            (cons (reverse_if_list (car original_list)) reversed_list)
            (reverse_iter (cdr original_list) (cons (reverse_if_list (car original_list)) reversed_list))
        )
    )
    (if (null? l) nil
        (reverse_iter l nil)
    )
)  


(define (deep-reverse lst)
    (define (deep_reverse_iter original_list reversed_list)
        (cond (
            ; (not (pair? original_list)) 
            ;     original_list)
            ((null? (cdr original_list)) 
                (cons (deep_reverse_iter (car original_list)) nil))
            (else 
                (deep_reverse_iter (cdr original_list) (cons (car original_list) reversed_list)))
            )
    )
    (if (null? lst) nil
        (deep_reverse_iter lst nil)
    )
)


;