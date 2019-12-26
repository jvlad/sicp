(define (* a b)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))

;;;;;;;;;;;;;;;;;

(define (halve x)
    (/ x 2))

(define (double x)
    (+ x x))

(define (mul a b)
  (fast-mul a b))  

(define (fast-mul a b)
  (cond ((= b 0) a)
  ((even? n) (fast-mul (+ a a) (/ b 2)))
  (else (+ a (fast-mul a (- b 1))))))

(define (fast-mul res a b)
    (cond ((= n 0) res)
        ((even? n) (fast-mul mul (double b b) (halve n 2)))
        (else (fast-mul (+ mul b) b (- n 1)))))



