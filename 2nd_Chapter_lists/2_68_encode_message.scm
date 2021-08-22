; ###### Thu Aug 12 20:21:08 CEST 2021
; The encode procedure takes as arguments a message and a tree and produces the list of bits
; that gives the encoded message.

; (define (encode message tree)
;   (if (null? message)
;       '()
;       (append (encode_symbol (car message) tree)
;               (encode (cdr message) tree))))
; (define (encode message tree)
;   (if (null? message)
;       '()
;       (append (encode_symbol (car message) tree)
;               (encode (cdr message) tree))))
; encode_symbol is a procedure, which you must write, that returns the list of bits that
; encodes a given symbol according to a given tree. You should design encode_symbol so that
; it signals an error if the symbol is not in the tree at all. Test your procedure by
; encoding the result you obtained in Exercise 2_67 with the sample tree and seeing whether
; it is the same as the original sample message.


(define (make_leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol_leaf x) (cadr x))

(define (weight_leaf x) (caddr x))

(define (make_code_tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))


(define (left_branch tree) (car tree))

(define (right_branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol_leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight_leaf tree)
      (cadddr tree)))

; ##########################

(define (left_branch tree) (car tree))

(define (right_branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol_leaf tree))
      (caddr tree)))

(define (element_of_set? x set)
    (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element_of_set? x (cdr set))))
)

(define (contains x set)
    (element_of_set? x set)
)

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode_symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode_symbol symb tree)
    (define (encode_symbol_rec symb tree resulting_path)
        (cond ((not (contains symb (symbols tree))) (display '(internal error)))
            ((leaf? tree) resulting_path)
            ((contains symb (left_branch tree)) (encode_symbol_rec symb (left_branch tree) (append resulting_path (list 0))))
            (else (encode_symbol_rec symb (right_branch tree) (append resulting_path (list 1))))
        )
    )
    (encode_symbol_rec symb tree '())
)

(define sample_tree
  (make_code_tree (make_leaf 'A 4)
                  (make_code_tree
                   (make_leaf 'B 2)
                   (make_code_tree (make_leaf 'D 1)
                                   (make_leaf 'C 1)))))

(define sample_message 'B)

(encode_symbol sample_message sample_tree)

(define sample_message '(A D A B B C A))

(encode sample_message sample_tree)

; Output: (0 1 1 0 0 1 0 1 0 1 1 1 0)
; Expected: (0 1 1 0 0 1 0 1 0 1 1 1 0)  

