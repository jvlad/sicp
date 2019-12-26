; f(n)=n  if n<3 
; and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n>3
; 0 1 2 4 11

(define (f a)
    (if (< a 3) 
        a
        (f-iter 2 1 0 (- a 2)))
)

(define (f-iter a b c count)
    (if (= count 0)
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))
    )
)

(f 3)