; ###### Fri Mar 6 21:46:59 MSK 2020  
;(x + 3 * (x + y + 2))

; (x + 3 * a + b)
; x + (3 * a + b)

; (3 * a) + b
; 3 * a * b

; 3 * a + b * c
; (3 * a) + b * c

; (define (sum? x)
;   (and (pair? x) (eq? (car x) '+)))

; (a * b + c)

; for tests
(define exp1 '(a * b * (c + d) + e))

(define (sum_basic? exp)
    (if (null? (cdr exp))
        #f
        (if (eq? (cadr exp) '+)
            #t
            (sum_basic? (cddr exp))
        )
    )
)

(define (sum? exp)  
    (if (not (pair? exp))
        #f
	    (sum_basic? exp)
    )
)

(define (product? exp)
    (if (not (pair? exp))
        #f
    	(not (sum_basic? exp))
    )
)

(cond ((sum? (__ s)) __)
    ((product? (__ s)) __)
    (else (display "unsupported operation"))
)

(define (left_sublist_before_match split_char input_list)
    (define (left_sublist_iter input_list result_list)
        (if (null? input_list) 
            nil
            (if (eq? (car input_list) split_char)
                (if (null? (cdr result_list))
                    (car result_list)
                    result_list
                )
                (left_sublist_iter 
                    (cdr input_list) 
                    (append result_list (list (car input_list))))
            )
        )
    )
    (left_sublist_iter input_list nil)
)

(define (addend s)
    (left_sublist_before_match '+ s)  
)

; (a + b)  
; (a + b + c)  
; (a + c * d)  
; (a * b + c)  
; (a * b * (x + y) + c)  
; (a * b * c)  
; (a * b)  

(define (unwrap_if_single_item input_list)
    (if (null? (cdr input_list))
        (car input_list)
        input_list
    )
)

(unwrap_if_single_item '(a))
(unwrap_if_single_item '(a + c))
(unwrap_if_single_item '(a + c + e))  


(define (augend s)  
    (if (eq? (cadr s) '+)
        (unwrap_if_single_item (cddr s))
        (augend (cddr s))
    )
)

(augend '(a + b))
(augend '(a + b + c))
(augend '(a + c * d))
(augend '(a * b + c))
(augend '(a * b * (x + y) + c))  

(define (multiplier p) (car p))  

(define (multiplicand p)  
    (unwrap_if_single_item (cddr p))
)

(multiplier '((a + c) * d))  
(multiplier '(a * b + c))  
(multiplier '(a * b * (x + y))  

(multiplicand '((a + c) * d))  
(multiplicand '(a * b + c))  
(multiplicand '(a * b * (x + y))  

