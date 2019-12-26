(define (make-mobile left right)
  (list left right))

; structure: Mobile | Number (Weight)
(define (make-branch length structure)
  (list length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))  

(define m1 
  (make-mobile 
   (make-branch 1 1)
   (make-branch 1 3)))

(define m2 
  (make-mobile 
   (make-branch 1 m1)
   (make-branch 1 3)))

(define (weigh_branch branch)
    (if (pair? (branch-structure branch))
        (+ (weigh_branch (left-branch (branch-structure branch)))
            (weigh_branch (right-branch (branch-structure branch)))
        )
        (branch-structure branch)
    )
)

(define (total-weight mobile)
  (+ (weigh_branch (left-branch mobile))
    (weigh_branch (right-branch mobile)))
)

(display (total-weight m1))
(newline)
(display (total-weight m2))  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(define (torque-left mobile)
    (* (branch-length (left-branch mobile)) 
        (weigh_branch (left-branch mobile)))
)

(define (torque-right mobile)
    (* (branch-length (right-branch mobile)) 
        (weigh_branch (right-branch mobile)))
)

(define (balanced_branch branch)
    (if (pair? (branch-structure branch))
        (balanced? (branch-structure branch))
        #t
    )
)

(define (all_nested_balanced? mobile)
    (and (balanced_branch? (left-branch mobile))
        (balanced_branch? (right-branch mobile)))
)

(define (balanced? mobile)
    (and (= (torque-left mobile) (torque-right mobile))
        (all_nested_balanced? mobile))
)  

;;;;;

Suppose we change the representation of mobiles so that the constructors are

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

A: only `(right-branch mobile)` and `(branch-structure branch)` needs to be changed

