; selector which tasks didn't ask to make, though it's another option of representing the segment
(define (make-segment shift_vector seg_vector)
    (cons shift_vector seg_vector))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (add-vect (start-segment segment) (cdr segment)))

;;;

(define v1 (make-vect 3 4))
(define v2 (make-vect 1 2))
(define seg1 (make-segmetn v1 v2))
(display (start-segment seg1))
(newline)
(display (end-segment seg1))
(newline)


(define (make-segment start_vector end_vector)
    (cons shift_vector seg_vector))

(define (start-segment segment)
    (car segment))

(define (end-segment segment)
    (cdr segment))

(define seg1 (make-segmetn v1 v2))
(display (start-segment seg1))
(newline)
(display (end-segment seg1))
(newline)