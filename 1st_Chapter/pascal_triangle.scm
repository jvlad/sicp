(define (pascal row col)
    (cond
        ((or (> col row) (< row 0) (< col 0)) 0)
        ((= row 0) 1)
        (else (+ (pascal (- row 1) (- col 1)) (pascal (- row 1) col)))
    )
)

(pascal 4 2)