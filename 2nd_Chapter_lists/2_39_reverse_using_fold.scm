(define (accumulate op init seq)
    (if (null? seq)
        init
        (op (car seq) (accumulate op init (cdr seq)))))

(define (fold-right op init seq)
    (accumulate op init seq)
)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

;(define (reverse sequence)
;  (fold-right (lambda (x y) (append y (list x))) nil sequence))

(define (reverse sequence)
  (fold-left (lambda (x y) (cons y x)) nil sequence))

(define t1 (list 1 2))
(define t2 (list 1 2 3))
(reverse t2)

((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))

(() ((2 1)) ((3 1) (3 2)) ((4 1) (4 2) (4 3)) ((5 1) (5 2) (5 3) (5 4)) ((6 1) (6 2) (6 3) (6 4) (6 5)))