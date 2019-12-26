(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define phi
  (fixed-point (lambda (x) (+ 1 (/ 1 x))))

;;;;;;;;;

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define x-pow
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2))

(define x-pow
  (fixed-point (lambda (x) (/ (+ x (/ (log 1000) (log x))) 2)) 2))

x-pow

; 2
; 9.965784284662087
; 3.004472209841214
; 6.279195757507157
; 3.759850702401539
; 5.215843784925895
; 4.182207192401397
; 4.8277650983445906
; 4.387593384662677
; 4.671250085763899
; 4.481403616895052
; 4.6053657460929
; 4.5230849678718865
; 4.577114682047341
; 4.541382480151454
; 4.564903245230833
; 4.549372679303342
; 4.559606491913287
; 4.552853875788271
; 4.557305529748263
; 4.554369064436181
; 4.556305311532999
; 4.555028263573554
; 4.555870396702851
; 4.555315001192079
; 4.5556812635433275
; 4.555439715736846
; 4.555599009998291
; 4.555493957531389
; 4.555563237292884
; 4.555517548417651
; 4.555547679306398
; 4.555527808516254
; 4.555540912917957
; 4.555532270803653  


; 2
; 5.9828921423310435
; 4.922168721308343
; 4.628224318195455
; 4.568346513136242
; 4.5577305909237005
; 4.555909809045131
; 4.555599411610624
; 4.5555465521473675
; 4.555537551999825

;;;;;;;;;;;

(define (cont-frac n d k)
    (define (cont-frac-worker i)
        (if (= i k) 
            (/ (n i) (d i))
            (/ (n i)(+ (d i) (cont-frac-worker (+ i 1))))))
  (cont-frac-worker 1))  

(define (cont-frac n d k)
    (define (cont-frac-iter i result)
        (if (= i 0) 
            result
            (cont-frac-iter 
                (- i 1) 
                (/ (n i)(+ (d i) result)))))
  (cont-frac-iter (- k 1) (/ (n k) (d k)))) 

;;;;;;;;;;;;;;;;;;;;;;;

(define (d i)
    (define (not-ordinal i) 
            (* 2 (/ i 3)))
    (let ((index (+ i 1)))
    (if (= (remainder (/ index 3)) 0)
        (not-ordinal index)
        1))
)

(define k 10)
(cont-frac (lambda (i) 1.0)
           d
           k)

;;;;;;;;;;;;;;;;;;;;;;;

(define (tan-cf x k)
    (cont-frac 
        (lambda (i) (if (= i 1) x (* -1 x x))) 
        (lambda (i) (- (* i 2) 1)) 
        k)
  )  

;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;

(define (fixed-point-of-transform g transform guess)
  (fixed-point (transform g) guess))

(define (repeated f n)
  (define (compose f g)
	(lambda (x) (f (g x))))
  (define (rep func i)
	(if (= n i)
        func
        (rep (compose f func) (+ i 1))))
  (rep f 1))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (average a b)
    (/ (+ a b) 2))

(define (root n x)
  (fixed-point-of-transform (lambda (y) (/ x (expt y (- n 1))))
                            (repeated average-damp 2)
                            1.0))

(root 2 9)  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (iterative-improve good-enough? improve)
    (lambda (x) (
        define (iterimp current)
            (if (good-enough? current)
                current
                (iterimp (improve current))
            )
        )
        (iterimp x)
    )
)


(define (fixed-point f first-guess)
    (let (tolerance 0.00001)
    (define (close-enough? v1 v2)
        (< (abs (- v1 v2)) tolerance))

    (define (good-enough? x)
        (close-enough? x (f x)))

    ((iterative-improve good-enough? f) 1)
)  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt x)
    (define (good-enough? guess)
        (< (abs (- (square guess) x)) 0.001))
    
    (define (improve guess)
        (average guess (/ x guess)))

    ((iterative-improve good-enough? improve) first-guess))

(sqrt 9)
(fixed-point (lambda (y) (+ (sin y) (cos y)))
             1.0)

