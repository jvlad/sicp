(define x (list 1 2 3))

(define y (list 4 5 6))

(append x y)
expected: (1 2 3 4 5 6)
OK

(cons x y)
((1 2 3) (4 5 6))
actual: ((1 2 3) 4 5 6)

(list x y)
((1 2 3) (4 5 6))