(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

Types resolved:  
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list [empty-board: Board])
        (filter
         (lambda ([positions: Board]) (safe? k positions))
         (flatmap
          (lambda ([rest-of-queens: Board])
            (map (lambda (new-row)
                   ([adjoin-position new-row k rest-of-queens: Board]))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(adjoin-position new-row k rest-of-queens): Board

Board example: (list (list 1 1) (list 1 3)....)

Board: list of pairs like (row col)

((1 1) (3 3) (2 3))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Solution:  
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
    (cons (cons new-row k) rest-of-queens)
)

(define (safe? col board)
    (define (same_row? lh rh)
        (= (car rh) (car lh))
    )
    (define (safe_diagonal lh rh)
        (not (= (abs (- (car lh) (car rh))) (abs (- (cdr lh) (cdr rh)))))
    )
    (define (safe_pair? lh rh)
        (and (not (same_row? lh rh))
            (safe_diagonal lh rh))
    )
    (let ((not_safe_list 
            (filter 
                (lambda (current) (not (safe_pair? (car board) current)))
                (cdr board)
            )))
    (if (null? not_safe_list) #t #f))
)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(queens 4)