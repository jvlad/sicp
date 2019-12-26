(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
  (newline))

(define (make-segment pstart pend) 
    (cons pstart pend))

(define (start-segment s)
    (car s))

(define (end-segment s)
    (cdr s))

(define (make-point x y)
    (cons x y))
    
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (average a b)
    (/ (+ a b) 2))

(define (midpoint-segment s)
    (let ((x-center (average (x-point (start-segment s)) (x-point (end-segment s)))) 
          (y-center (average (y-point (start-segment s)) (y-point (end-segment s)))))
    (make-point x-center y-center)))

(print-point (midpoint-segment (make-segment (make-point 1 4) (make-point 3 7))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; 2.3 Rectangle
;1. diagonal coordinates
;2. left corner and (width, height)

(define (area rect)
    (* (width rect) (height rect)))

(define (perimeter rect)
    (* 2 (+ (width rect) (height rect))))

(define (make-rect a b)
    (cons a b))

; (define (width rect)
;     (let ((corner1 (car rect))
;             (corner2 (cdr rect)))
;     (abs (- (cdr corner2) (cdr corner1)))))

; (define (height rect) 
;     (let ((corner1 (car rect))
;             (corner2 (cdr rect)))
;     (abs (- (car corner2) (car corner1)))))


;;;;;;;;;;;;;

(define (make-rect corner width height) 
    (cons corner (cons width height)))

(define (width rect) 
    (car (cdr rect)))

(define (height rect) 
    (cdr (cdr rect)))

; (define test-rect (make-rect (make-point 4 0) (make-point 0 5)))
(define test-rect (make-rect (make-point 2 1) 3 4))
(area test-rect)
(newline)
(perimeter test-rect)

;;;;;;;;;;;;;

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
    
(define (div x divider res)
  (display x)
  (display divider)
  (display res)
  (if (= (mod x divider) 0)
      (div (/ x divider) divider (+ res 1))
      res))
  
(define (car z)
  (div z 2 0))

(define (cdr z)
   (div z 3 0))
  
(cons 3 4)
(car (cons 3 4))
(cdr (cons 3 4))