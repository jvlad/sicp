; 2.50: Define the transformation flip-horiz, which 
; * flips painters horizontally, 
; * rotate painters counterclockwise by 180 degrees 
; * and 270 degrees.

(define (flips_horizontally painter)
  (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate_counterclockwise_180_degrees  painter)
    (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

(define (rotate_counterclockwise_270_degrees  painter)
    (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

;;;;;;

flips_horizontally
    (make-vect 1.0 0.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)

rotate_counterclockwise_180_degrees
    (make-vect 1.0 1.0)
    (make-vect 0.0 1.0)
    (make-vect 1.0 0.0)

rotate_counterclockwise_270_degrees
    (make-vect 0.0 1.0)
    (make-vect 0.0 0.0)
    (make-vect 1.0 1.0)  

