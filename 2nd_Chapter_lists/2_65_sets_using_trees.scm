; ###### Sun Jun 21 17:44:48 MSK 2020

; implementations of union-set and intersection-set for sets implemented as (balanced)
; binary trees

; Utils

(define (adjoin-set x set)  
    (cond ((null? set) (list x))
        ((= x (car set)) set)
        ((< x (car set)) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))
    )
)

(define (union-set-for-lists set1 set2)
  (if (null? set2)
      set1
      (union-set-for-lists (adjoin-set (car set2) set1) (cdr set2))))  

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))  

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))  

; Solution

(define (union-set leftTr rightTr)
    (list->tree 
        (union-set-for-lists 
            (tree->list-2 leftTr) 
            (tree->list-2 rightTr)
        )
    )
)

(define (intersection_list lhs rhs)
    (cond ((or (null? lhs) (null? rhs)) nil)
        ((= (car lhs) (car rhs)) 
            (cons (car lhs) (intersection_list (cdr lhs) (cdr rhs))))
        ((< (car lhs) (car rhs))
            (intersection_list (cdr lhs) rhs))
        ((> (car lhs) (car rhs))
            (intersection_list lhs (cdr rhs)))
    )
)

(define (factorial n)
    (if (= n 0)
        1
        (* n (factorial (- n 1))))
)

(define (factorial n)
    (define (factorial_rec cur res)
        (if (= cur 0)
            res
            (factorial_rec (- cur 1) (* res cur))
    )
    (factorial_rec n 1)
)

(factorial_rec a b)
(factorial_rec c d)
(factorial_rec e f)

(factorial n)
    (factorial k)
        ()

(define x 1)
(define y 2)
(define z (add x y))
(print z)

(define (add x y)
    (+ x y)
)

---

[->100]

Stack:  
* ->x
* ->y 
* return to: 98

(define (intersection_list lhs rhs)
    (define (intersection_list_rec lhs rhs result)
        (cond ((or (null? lhs) (null? rhs)) result)
            ((= (car lhs) (car rhs)) 

            )
        )
    )
    (intersection_list_rec lhs rhs nil)


    (cond ((or (null? lhs) (null? rhs)) nil)
        ((= (car lhs) (car rhs)) 
            (cons (car lhs) (intersection_list (cdr lhs) (cdr rhs))))
        ((< (car lhs) (car rhs))
            (intersection_list (cdr lhs) rhs))
        ((> (car lhs) (car rhs))
            (intersection_list lhs (cdr rhs)))
    )
)

(intersection_list '(1 2) '(2 3))


(define (intersection-set lhs rhs)
)


n:      n - k1                  >=k1
n-1:    n - k1 - k2             >=(k1 + k2)
n-m:    n - M
x > m
n - x:  n - M - X, X >= 0       
.       n - sum(k1..kx)
        n - sum(k1..kx) >= n - x*K      sum(k1..kx) <= y <= n, sum(k1..kx) <= x*K
                                        <=x*K 
.
.
1

n:      n - k1                  <=l1
n-1:    n - k1 - k2             <=(l1 + l2)
n-m:    n - M
x > m
n - x:  n - M - X, X >= 0       <=sum(l1..lx) <=x*L
        n - sum(k1..kx), 
        K >= kx: 
        n - sum(k1..kx) >= n - x*K      
                                        
        R, R >= max(K, L)
        >= (n - x*R)            <=(x*R)
.
.
1       >= (n - n*R)            n <= (n*R)
        0 >= (n - n*R)          R >= 1
        R >= 1, R >= kx 
        