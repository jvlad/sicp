;; Exercise 2.69: The following procedure takes as its argument a list of symbol-frequency pairs (where no symbol appears in more than one pair) and generates a Huffman encoding tree according to the Huffman algorithm.

;; (define (generate-huffman-tree pairs)
;;   (successive-merge (make-leaf-set pairs)))
;; make-leaf-set is the procedure given above that transforms the list of pairs into an ordered set of leaves. Successive-merge is the procedure you must write, using make-code-tree to successively merge the smallest-weight elements of the set until there is only one element left, which is the desired Huffman tree. (This procedure is slightly tricky, but not really complicated. If you find yourself designing a complex procedure, then you are almost certainly doing something wrong. You can take significant advantage of the fact that we are using an ordered set representation.)

(define (make_leaf symbol weight)
  (list 'leaf symbol weight))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol_leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight_leaf tree)
      (cadddr tree)))

(define (make_code_tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

;; /////////////////////

(define (generate_huffman_tree pairs)
  (successive_merge (make_leaf_set pairs)))

(define (tree_to_pair tree)
    (cons (symbols tree) (weight tree))
)

(define (succesive_merge leaf_set)
    (define (succesive_merge_rec leaf_set result)
        (make_code_tree (car leaf_set) (cdr leaf_set))
    )
    (succesive_merge_rec leaf_set '())
)