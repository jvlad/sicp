
(define (dot-product v w)
  'sorry-map-is-not-implemented-yet
  (accumulate + 0 (map * v w)))

(define (accumulate op init seq)
    (if (null? seq)
        init
        (op (car seq) (accumulate op init (cdr seq)))))

(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (map_single op seq)
    (accumulate 
        (lambda (x y) (cons (op x) y)) 
        nil 
        seq))

(define (map op . seqs)
    (cond ((null? (car seqs)) nil)
        ((null? (cdr seqs)) (map_single op (car seqs)))
        (else 
            (cons (accumulate op (car (car seqs)) (map_single car (cdr seqs)))
                (map op (cdr seqs))))))


(map + (list 1) (list 2))  
expected: (3)


(map_single car (list (list 1) (list 2)))  

(accumulate op (car (car seqs)) (map_single car (cdr seqs)))
    (accumulate + 1 (map_single car ((2))))
        (map_single car ((list 2)))

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

(dot-product (list 1 2 3) (list 1 2 3))  

; ###### Sat Jan 4 4:40pm  

(define (map_single op seq)
    (accumulate 
        (lambda (x y) (cons (op x) y)) 
        nil 
        seq))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (map op . seqs)
  	(define (map_n op seqs_list)
          (cond ((null? (car seqs_list)) nil)
	        ; (else (map_single op (car seqs)))
	        (else (cons (apply op (map_single car seqs_list))
                (map_n op (map_single cdr seqs_list))))
    		)
    )
	(map_n op seqs)
)


[x]Test1
(map (lambda (x) (+ 1 x)) (list 3 2 4))  
Expected: (4 3)

[]Test4
(map (lambda (x) (+ 1 x)) (list 3 2))  

[x]Test2
(map + (list 3) (list 2))  
Expected: (5)


[x]Test3
(map + (list 3) (list 2) (list 1))  
Expected: (6)


Test4
(map + (list 3 1) (list 2 1)


(map + (list 3 2 1) (list 3 2 1))  
Expected: (6 4 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (dot-product v w)
    (accumulate + 0 (map * v w))
)

(dot-product (list 1 2 3) (list 1 2 3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (matrix-*-vector m w) 
    (map (lambda (x) (dot-product x w)) m)
)

(define m (list (list 1 2 3 4) (list 4 5 6 6) (list 6 7 8 9)))

(define w (list 1 1 1 1))

(matrix-*-vector m w)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map 'your-answer-here m)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (transpose mat)
  (accumulate-n cons nil mat))

(transpose (list (list 1) (list 2)))

expected: ((1 2))  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (y) (map (lambda (x) (dot-product y x)) cols)) m)))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (y) (matrix-*-vector cols y)) m)))

(define m (list (list 1) (list 2)))
2*1

(define x (list (list 1 1)))
1*2

Expected size: 2*2
1 1
2 2
((1 1) (2 2))

(matrix-*-matrix m x)

transpose x
(list (list 1) (list 1)))

((1) (2))
((1) (1))

1 2

3 4 5
6 7 8

3 6
4 7
5 8