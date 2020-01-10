(define (flatmap proc seq)
  (accumulate append nil (mapi proc seq)))

(define (accumulate op initial seq)
    (if (null? seq) initial 
        (op (car seq) (accumulate op initial (cdr seq))))
)

(define (mapi op seq)
    (accumulate 
        (lambda (x y) (cons (op x) y)) 
        nil 
        seq))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define (unique-pairs n)
    (flatmap (lambda (i) 
        (mapi 
            (lambda (j) (list j i)) (enumerate-interval (+ i 1) n))) 
            (enumerate-interval 1 n))
)

(unique-pairs 2)

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (divides? test-divisor n)
  (if (= (remainder n test-divisor) 0)
      #t
      #f)
)

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next test-divisor)
    (cond ((= test-divisor 2) 3)
        (else (+ test-divisor 2)))
)

(define (square a)
    (* a a))

(define (prime-sum-pairs n)
  (mapi make-pair-sum
       (filter prime-sum?
               (unique-pairs n)))
)

(prime-sum-pairs 3)