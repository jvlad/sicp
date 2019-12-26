
(define (map func list)
    (cond ((null? list) nil)
        ((not (pair? list)) (func list))
        (else (cons (func (car list)) 
                    (map func (cdr list))))))

(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))


(define (square-tree tree)
    (map 
        (lambda (subtree) 
            (if (pair? subtree)
                (square-tree subtree)
                (* subtree subtree))) 
        tree))

;;;;;;;;;;;;;;;;;;

(define (square a)
    (* a a))

(define (tree-map f tree)
    (map (lambda (subtree) 
            (if (pair? subtree)
                (tree-map f subtree)
                (f subtree))) 
        tree))


(define (square-tree tree) (tree-map square tree))