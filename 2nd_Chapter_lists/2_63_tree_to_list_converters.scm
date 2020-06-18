(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

; Test
(tree->list-2 '(0 (1 nil nil) (2 nil nil)))
(tree->list-2 '(0 (1 (3 () ()) (4 () ())) (2 (5 () ()) (6 () ()))))
; Expected: 
(3 1 4 0 5 2 6)


; Run-time
(copy-to-list '(it1) (cons it0 
    (copy-to-list '(it2) nil)))
        
        (copy-to-list nil (cons it2 (copy-to-list nil nil)))
            (copy-to-list nil (cons it2 nil))
                (copy-to-list nil '(it2)')
                    '(it2)

    (copy-to-list '(it1) (cons it0 '(it2)))
        (copy-to-list '(it1) '(it0 it2))
            (copy-to-list nil (cons it1 (copy-to-list nil '(it0 it2))))
                (copy-to-list nil '(it1 it0 it2))
                    '(it1 it0 it2)

0
1       2
3 4     5 6

(6)
(2 6)
(5 2 6)
(0 5 2 6)
<left> (0 5 2 6)
<left_remaining> (1 4) (0 5 2 6)
(3 1 4) (0 5 2 6)
(3 1 4 0 5 2 6)

tree == (`it2`)
(copy-to-list null
                (cons `it2`
                    (copy-to-list nul
                                    result-list)))

; Do the two procedures produce the same result for every tree? If not, 
; how do the results differ? 
; 

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

; What lists do the two procedures produce 
; for the trees in Figure 2-16?

;#1
7
3       9
1 5     _ 11

'(7 (3 (1 nil nil) (5 nil nil)) (9 nil (11 nil nil)))
; 1st: 
    (tree->list-1 '(7 (3 (1 nil nil) (5 nil nil)) (9 nil (11 nil nil))))
    Expected: (1 3 5 7 9 11)
    Act: (1 3 5 7 9 11)

; 2nd: 
    (tree->list-2 '(7 (3 (1 nil nil) (5 nil nil)) (9 nil (11 nil nil))))
    Expected: (1 3 5 7 9 11)
    Act:

; #2
3
1   7
    5   9
        _   11

'(3 (1 nil nil) (7 (5 nil nil) (9 nil (11 nil nil))))
; 1st: 
    (tree->list-1 '(3 (1 nil nil) (7 (5 nil nil) (9 nil (11 nil nil)))))
    Expected: (1 3 5 7 9 11)
    Act: (1 3 5 7 9 11)

; 2nd: 
    (tree->list-2 '(3 (1 nil nil) (7 (5 nil nil) (9 nil (11 nil nil)))))
    Expected: (1 3 5 7 9 11)
    Act: (1 3 5 7 9 11)


; #3
5
3       9
1   _   7   11
; 1st: 
; 2nd: 


; Do the two procedures have the same order of growth in the number of steps required to
; convert a balanced tree with n elements to a list? If not, which one grows more slowly?
(tree->list-1 n)
    append n/2
        tree->list-1 n/2
            append n/4
            tree->list-1 n/4
            tree->list-1 n/4
        tree->list-1
            n/2
        
        T(n) = n/2 + 2*T(n/2)
            T(n) = n/2 + 2*(n/4 + 2*T(n/4))
        T(n) = n + 4*T(n/4)
        T(n) = n + n/2 + 8*T(n/8)
        T(n) = 2n + 16*T(n/16)
        ...
            Iteration count: log(k)
            n = k
            k*log(k)/2 + k*T(1) 
            k*log(k)/2 + k
            k*log(k)

