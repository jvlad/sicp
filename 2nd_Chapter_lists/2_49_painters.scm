(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

; The painter that draws the outline of the designated frame.
(define outline-painer
    (define seg_list (list 
                        (make-segment (make-vect 0 0) (make-vect 1 0))
                        (make-segment (make-vect 1 0) (make-vect 1 1))
                        (make-segment (make-vect 1 1) (make-vect 0 1))
                        (make-segment (make-vect 0 1) (make-vect 0 0))))
    (segments->painter seg_list))
      

; The painter that draws an "X" by connecting opposite corners of the frame.
(define outline-painer
    (define seg_list (list 
                        (make-segment (make-vect 0 0) (make-vect 1 1))
                        (make-segment (make-vect 1 0) (make-vect 0 1))))
    (segments->painter seg_list))

; The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.
(define outline-painer
    (define seg_list (list 
                        (make-segment (make-vect 0 0.5) (make-vect 0.5 1))
                        (make-segment (make-vect 0.5 1) (make-vect 1 0.5)
                        (make-segment (make-vect 1 0.5) (make-vect 0.5 0)
                        (make-segment (make-vect 0.5 0) (make-vect 0 0.5))))
    (segments->painter seg_list))

