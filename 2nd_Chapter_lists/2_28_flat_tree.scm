; Write a procedure fringe that takes as argument a tree (represented as a list) and returns
; a list whose elements are all the leaves of the tree arranged in left-to-right order.

(define (fringe lst)
  'your-code-here)  


fringe_iter ((1 2) 3) nil
    append (flat_if_list (1 2)) (3)
        fringe_iter (1 2) nil
            (append (flat_if_list 1) (flat_if_list (2)))












; (1 2)
; (list 1 2 (list 3 4) (list 5 6) 7 8 9)
(fringe ((3 4)))
(cons (flat_if_list (3 4)) (fringe nil))
    (fringe (3 4)) == (3 4)
        (cons (flat_if_list 3) (fringe (4)))
        (cons 3 (4)) == (3 4)
            (fringe (4))
                (cons (flat_if_list 4) (fringe nil))
                    (4)
(cons (3 4) (fringe nil))

(define (fringe lst)
    (define (flat_if_list item)
        (if (pair? item)
            (fringe item)
            (list item))
    )
    (if (null? lst) nil
        (append (flat_if_list (car lst)) (fringe (cdr lst)))
    )
)

(fringe (list (list 3 4)))

