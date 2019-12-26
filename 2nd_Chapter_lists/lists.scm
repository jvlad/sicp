
(define (last-pair l)
    (if (null? (cdr l))
        (list (car l))
        (last-pair (cdr l))))

(last-pair (list 23 72 149 34))  


(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (reverse l)
    (define (reverse-rec reversed_list last_item)
        (if (or (null? reversed_list) (null? (cdr reversed_list)))
            (append reversed_list (list last_item))
            (append (reverse-rec (cdr reversed_list) (car reversed_list)) (list last_item))
        )
    )
    (reverse-rec (cdr l) (car l))
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  

(define (reverse l)
    (define (reverse_iter part_to_reverse item_to_append reversed_part)
        (cond ((null? part_to_reverse) (append reversed_part (list item_to_append)))
            (else (reverse_iter (cdr part_to_reverse) 
                    (car part_to_reverse) 
                    (append reversed_part (list item_to_append))))
        )
    )
    (reverse_iter (cdr l) (car l) (list null))
)

(reverse (list 1 4 9 16 25))



1 -> 4 -> 9 -> 25 -> nil

----

25 -> 9 -> 4 -> 1 -> nil

25 -> nil, 9 -> 4 -> 1 -> nil

9 -> 25,  4 -> 1 -> nil

4 -> 9 -> 25,  1 -> nil

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

; ###### Fri Nov 15 18:23:56 MSK 2019

