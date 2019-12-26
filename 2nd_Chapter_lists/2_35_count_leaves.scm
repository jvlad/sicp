(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
    (accumulate + 0 
        (map (lambda (item) 
            	(if (pair? item)
                    (count-leaves item)
                    1))
	         t)))

(count-leaves (list 1 (list 3 4 5)))