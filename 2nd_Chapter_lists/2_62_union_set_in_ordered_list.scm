; ###### Wed Apr 15 22:06:22 MSK 2020

(define (union-set lhs rhs)
    (cond ((null? lhs) rhs)
        ((null? rhs) lhs)
        ((< (car lhs) (car rhs))
            (union-set lhs (union-set (cdr lhs) rhs))
        )
        (else)
    )
)


; ###### Fri Apr 3 20:06:04 MSK 2020

(define (union-set set1 set2)
    (define (merge_sorted_set lhs rhs result)
        (cond ((null? lhs) (append result rhs))
            ((null? rhs) (append result lhs))
            ((< (car lhs) (car rhs)) 
                (merge_sorted_set (cdr lhs) rhs (append result (list (car lhs))))
            )
            ((> (car lhs) (car rhs)) 
                (merge_sorted_set lhs (cdr rhs) (append result (list (car rhs))))
            )
            (else (merge_sorted_set (cdr lhs) rhs result))
        )
    )
    (merge_sorted_set set1 set2 nil)
)

(define (union-set lhs rhs)
    (cond ((null? lhs) rhs)
        ((null? rhs) lhs)
        ((< (car lhs) (car rhs)) 
            (union-set (cdr lhs) (cons (car lhs) rhs))
        )
        ((> (car lhs) (car rhs)) 
            (cons (car rhs) (union-set lhs (cdr rhs)))
        )
        (else (union-set (cdr lhs) rhs))
    )
)

;###### Mon May 11 23:27:31 MSK 2020  

(define (union-set lhs rhs)
    (cond ((null? lhs) rhs)
        ((null? rhs) lhs)
        ((< (car lhs) (car rhs)) 
            (cons (car lhs) (union-set (cdr lhs) rhs))
        )
        ((= (car lhs) (car rhs))
            (cons (car lhs) (union-set (cdr lhs) (cdr rhs)))
        )
        (else 
            (cons (car rhs) (union-set lhs (cdr rhs)))
        )
    )
)

(define (union-set lhs rhs)
    (define (union_set_iter lhs rhs result)
        ()
        body)
)

(1 3)
(2 4)
()

(3)
(2 4)
(1)

(3)
(4)
(1)  2

(1 2) (cons (car result) element)

()
(4) 
(1 2) 3

in
    element: 3 
    result: (1 (2 nil))
    last_pair: (2 nil)
out
    a: (list (car last_pair) element) --> (2 3 nil)
    result: (cons (car result) a) --> (1 2 3 nil)
    last_pair: (list element) --> (3 nil)




(union-set '(1 2 3) '(2 3 4 5))
(union-set '(3) '(1 3))
(union-set '() '(4))
(union-set '(4) '(4))
(union-set '(4) '(0))
(union-set '(4) '())
(union-set '(5 8 9) '(1 4 5))
(union-set '(5 8 9) '(6 8 10 11))
(union-set '(5 8 9) '(9 10 11 12))
(union-set '(1 2 3) '(4 5 11 98))
(union-set '(4 5 11 98) '(1 2 3))













list
rec_call(source, res, -1)

rec_call(source, res) {
    if () {
        ...
        rec_call(source, res, )
    } else {
        ...
        return res
    }
}

original source (1 2 3 4)

(1 4)
(1 2 3 4)

n: size(res) == n-k
n-1: size(res) == n-k-k1
n-c: size(res) == n-(k)

X - const, X >= k_i






















(4 2 3 1)
(cons 

source: ()
res: 
for() {
    source = 
    res = 
}

source
res
for() {
    source = 
    res = 
}

source
res
for() {
    source = 
    res = 
}