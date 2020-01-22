
; edge1, edge2: vector
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin frame)
    (car frame))

(define (edge1 frame)
    (cadr frame))

(define (edge2 frame)
    (cadr (cdr frame)))

(define frame1 (make-frame (make-vect 5 6) (make-vect 1 2) (make-vect 3 4)))
(display (origin frame1))
(newline)
(display (edge1 frame1))
(newline)
(display (edge2 frame1))
(newline)


;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin frame)
    (car frame))

(define (edge1 frame)
    (cadr frame))

(define (edge2 frame)
    (cdr (cdr frame)))

(define frame2 (make-frame (make-vect 5 6) (make-vect 1 2) (make-vect 3 4)))
(display (origin frame2))
(newline)
(display (edge1 frame2))
(newline)
(display (edge2 frame2))
(newline)
