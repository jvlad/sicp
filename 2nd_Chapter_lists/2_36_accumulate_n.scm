(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons 
            (accumulate op init 
                (map (lambda (item) (car item)) 
                    seqs))
            (accumulate-n op init 
                (map (lambda (item) (cdr item)) 
                    seqs)))))  


; Simplified
(define (accumulate-n op init seqs)
    (if (null? (car seqs))
        nil
        (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

;;;;;;;;;;;;;;;;;;;;;

(map (lambda (item) 
        (car item)) 
    (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))  

(map (lambda (item) 
        (cdr item)) 
    (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))  


(accumulate-n + 0 (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(accumulate-n + 0 (list (list 1 2 3)))

(map * 2 (list 1 2 3))