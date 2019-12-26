(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))  

----

(define (improve guess x)
  (average guess (/ x guess)))  

(define (average x y)
  (/ (+ x y) 2))  

(define (good-enough? guess previous-guess)
  (< (/ (abs (- (guess previous-guess))) guess) 0.001))  


(define (new-sqrt-iter guess previous-guess x)
  (if (good-enough? guess previous-guess x)
      guess
      (new-sqrt-iter (improve guess x) guess 
                     x)))

(define (my-sqrt x)
  (new-sqrt-iter 1 0.9 42))


-----

1.8

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) (* 2 guess)) 3))  

(define (good-enough? guess previous-guess)
  (< (/ (abs (- guess previous-guess)) guess) 0.001))  

(define (cube-rootter guess previous-guess x)
  (if (good-enough? guess previous-guess)
      guess
      (cube-rootter (improve guess x) guess 
                     x)))

(define (cube-root x)
  (cube-rootter 1 0.9 x))



------


###### Sun Aug 18 10:16:23 IDT 2019


(define (f n)
    (if (< n 3) 
        n
        (+ (f (- n 1)) 
            (* 2 (f (- n 2))) 
            (* 3 (f (- n 3))))
            ))

---

(define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(define (f n)
    (if (< n 3) 
        n
        (f-iter 2 1 0 (- n 2))))

---

(define (pascal row col)
    (cond ((> col row) 0)
          ((< col 0) 0)
		  ((< row 1) 1)
        (else (+ (pascal (- row 1) (- col 1)) 
            (pascal (- row 1) col))))
    )

---

(define (fact-iter a b count)
    (if (= count 0)
        a
        (fact-iter (* a b) (+ a 1) (- count 1))))  

(define (fact n)
    (if (< n 2)
        1
        (fact-iter 2 1 (- n 1))))

(fact 2)

