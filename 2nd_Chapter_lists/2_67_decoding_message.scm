; ###### Thu Aug 12 20:18:41 CEST 2021

; Define an encoding tree and a sample message:
; (define sample_tree
;   (make_code_tree (make_leaf 'A 4)
;                   (make_code_tree
;                    (make_leaf 'B 2)
;                    (make_code_tree (make_leaf 'D 1)
;                                    (make_leaf 'C 1)))))
 
; (define sample_message '(0 1 1 0 0 1 0 1 0 1 1 1 0))
; Use the decode procedure to decode the message, and give the result.


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



(define (make_leaf_set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin_set (make_leaf (car pair)    ; symbol
                               (cadr pair))  ; frequency
                    (make_leaf_set (cdr pairs))))))



(define (decode bits tree)
  (define (decode_1 bits current_branch)
    (if (null? bits)
        '()
        (let ((next_branch
               (choose_branch (car bits) current_branch)))
          (if (leaf? next_branch)
              (cons (symbol_leaf next_branch)
                    (decode_1 (cdr bits) tree))
              (decode_1 (cdr bits) next_branch)))))
  (decode_1 bits tree))

(define (choose_branch bit branch)
  (cond ((= bit 0) (left_branch branch))
        ((= bit 1) (right_branch branch))
        (else (error "bad bit __ CHOOSE_BRANCH" bit))))


(define sample_tree
  (make_code_tree (make_leaf 'A 4)
                  (make_code_tree
                   (make_leaf 'B 2)
                   (make_code_tree (make_leaf 'D 1)
                                   (make_leaf 'C 1)))))

(define sample_message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample_message sample_tree)