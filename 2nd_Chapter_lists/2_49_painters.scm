(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame) (start-segment segment))
        ((frame-coord-map frame) (end-segment segment))))
     segment-list)))

; The painter that draws the outline of the designated frame.
(define (outline-painer frame)
    (define seg1 (make-segment (origin frame) (add-vect (origin frame) (edge1 frame))) 
                    (add-vect (origin frame) (edge2 frame))))
    (define seg2 (edge2 frame))


; The painter that draws an "X" by connecting opposite corners of the frame.
; The painter that draws a diamond shape by connecting the midpoints of the sides of the frame.

