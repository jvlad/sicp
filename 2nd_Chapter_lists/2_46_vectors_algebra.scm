
; A two-dimensional vector v running from the origin to a point can be represented as a pair
; consisting of an x-coordinate and a y-coordinate. Implement a data abstraction for vectors
; by giving a constructor make-vect and corresponding selectors xcor-vect and ycor-vect. In
; terms of your selectors and constructor, implement procedures add-vect, sub-vect, and
; scale-vect that perform the operations vector addition, vector subtraction, and multiplying
; a vector by a scalar:  
; (x1,y1)+(x2,y2) = (x1+x2,y1+y2)
; (x1,y1)−(x2,y2) = (x1−x2,y1−y2)
; s⋅(x,y) = (sx,sy)


(define (make-vect x y)
    (cons x y))

(define (xcor-vect vector)
    (car vector))

(define (ycor-vect vector)
    (cdr vector))

(define (add-vect v1 v2)
    (make-vect (+ (xcor-vect v1) (xcor-vect v2))
                    (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
    (make-vect (- (xcor-vect v1) (xcor-vect v2))
                    (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect s v)
    (make-vect (* s (xcor-vect v))
        (* s (ycor-vect v))
    ))

(define v1 (make-vect 3 4))
(define v2 (make-vect 1 2))
(display (xcor-vect v1))
(newline)
(display (ycor-vect v1))
(newline)
(display (add-vect v1 v2))
(newline)
(display (sub-vect v1 v2))
(newline)
(display (scale-vect 2 v1))
(newline)


(* s (xcor-vect v1)