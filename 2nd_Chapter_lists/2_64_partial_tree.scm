; ###### Sat Jun 20 20:32:33 MSK 2020

; The following procedure list->tree converts an ordered list to a balanced binary tree. The
; helper procedure partial-tree takes as arguments an integer n and list of at least n
; elements and constructs a balanced tree containing the first n elements of the list. The
; result returned by partial-tree is a pair (formed with cons) whose car is the constructed
; tree and whose cdr is the list of elements not included in the tree.

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))  

; Write a short paragraph explaining as clearly as you can how partial-tree works. Draw the
; tree produced by list->tree for the list (1 3 5 7 9 11)  

n == 6
left-size == 2
left-result == '((1 nil '(3 nil nil)) (5 7 9 11))
    (partial-tree '(1 3 5 7 9 11) 2)
        left-size == 0
        left-result == '(nil '(1 3 5 7 9 11))
            (partial-tree '(1 3 5 7 9 11) 0)
                '(nil '(1 3 5 7 9 11))
        left-tree == nil
        non-left-elts == '(1 3 5 7 9 11)
        right-size == 1
        this-entry == 1
        right-result == '((3 nil nil) '(5 7 9 11))
            (partial-tree '(3 5 7 9 11) 1)
        right-tree == '(3 nil nil)
        remaining-elts == '(5 7 9 11)
        Return:  
            '((1 nil '(3 nil nil)) (5 7 9 11))
left-tree == (1 nil '(3 nil nil))
non-left-elts == '(5 7 9 11)
right-size == 3
this-entry == 5
right-result == '((9 (7 nil nil) (11 nil nil)) nil)
    (partial-tree (7 9 11) 3)
        left-size == 1
        left-result == '((7 nil nil) (9 11))
            (partial-tree (7 9 11) 1)
        left-tree == (7 nil nil)
        non-left-elts == (9 11)
        right-size == 1
        this-entry == 9
        right-result == ((11 nil nil) nil)
            (partial-tree (11) 1)
        right-tree == (11 nil nil)
        remaining-elts == nil
        return: 
            ((9 (7 nil nil) (11 nil nil)) nil)
right-tree == '(9 (7 nil nil) (11 nil nil))
remaining-elts = nil
return: 
    '((5 (1 nil (3 nil nil) (9 (7 nil nil) (11 nil nil)))) nil)
    

5
1           9
_    3      7   11

; What is the order of growth in the number of steps required by list->tree to convert a
; list of n elements?

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))  

T(n) = 2*T(n/2)
Answer: linear growth order  