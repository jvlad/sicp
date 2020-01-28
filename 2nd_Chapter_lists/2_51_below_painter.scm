(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              split-point
                              (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.0)
                              (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))

; ---

(define (below painter1 painter2)
    (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
           (transform-painter painter1
                              (make-vect 0.0 0.0)
                              (make-vect 1.0 0.0)
                              split-point))
          (paint-top
           (transform-painter painter2
                              split-point
                              (make-vect 1.0 0.5)
                              (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

; ---
; 2nd implementation using beside

(define (rotate_counterclockwise_270_degrees  painter)
    (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))

(define (rotate_counterclockwise_90_degrees painter)
    (transform-painter painter
                     (make-vect 1.0 0.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))


(define (below painter1 painter2)
    (let ((turned1 (rotate_counterclockwise_90_degrees painter1))
        (turned2 (rotate_counterclockwise_90_degrees painter2)))
    (let ((paint_side_by_side (beside turned1 turned2)))
    (rotate_counterclockwise_270_degrees paint_side_by_side)
)))

(define (below painter1 painter2)
    (let ((turned1 (rotate_counterclockwise_90_degrees painter1))
        (turned2 (rotate_counterclockwise_90_degrees painter2)))
        (rotate_counterclockwise_270_degrees (beside turned2 turned1))
))