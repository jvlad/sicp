; ###### Sun Aug 18 14:26:42 IDT 2019

(define (fact-iter product multiplier count)
    ; (display product) (newline)
    ; (display multiplier) (newline)(newline)
    (if (= count 0)
        product
        (fact-iter (* product multiplier) (+ multiplier 1) (- count 1))))

(define (fact n)
    (if (< n 2)
        1
        (fact-iter 1 1 n)))

(display "actual:") (newline)
(display (fact 4))

; --------------
(newline)(newline)

(define (fact-recur n)
    (if (< n 2)
        1
        (* n (fact-recur (- n 1)))))

(display "expected:") (newline)
(display (fact-recur 4))

(newline)
