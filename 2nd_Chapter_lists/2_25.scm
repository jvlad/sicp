; Pick `7` from each list using car and cdr

;l = (1 3 (5 7) 9)
(define a (list 1 3 (list 5 7) 9))
(display a)
(display (car (cdr (car (cdr (cdr a))))))
(newline)

; l = ((7))
(define b (list (list 7)))
(display b)
(display (car (car b)))
(newline)

; l = (1 (2 (3 (4 (5 (6 7))))))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display c)
(display (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))))
(newline)