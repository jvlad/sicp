(define (make-interval a b) (cons a b))

(define (lower-bound interval)
  (car interval))

(define (upper-bound interval)
  (cdr interval)) 


(lower-bound (make-interval 2 5))
(upper-bound (make-interval 2 5))  

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (min x y)
    (if (< x y) x
        y))

(define (max x y)
    (if (< x y) y
        x))

(define (sub-interval x y)
  (let ((lower (min (- (lower-bound x) (lower-bound y)) 
                    (- (lower-bound x) (upper-bound y))))
        (upper (max (- (upper-bound x) (lower-bound y)) 
                    (- (upper-bound x) (upper-bound y)))))
        (make-interval lower upper)))

;check
(sub-interval (make-interval 3 5) (make-interval 1 2))

(define rrr 
  (sub-interval 
   (make-interval 2 4) 
   (make-interval 1 2)))

(display rrr)
         

(define (print-interval a) 
        (display "[")
        (lower-bound a)
        (display "..")
        (upper-bound a)
        (display "]"))

define 

(print (make-interval 2 5))  

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))  

;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-center-percent center percent)
    (let ((w (* center percent 0.01)))
    (make-center-width center w)))

(define (percent interval)
  (* (/ (width interval) (center interval)) 100)

(print (make-center-percent 3 25))