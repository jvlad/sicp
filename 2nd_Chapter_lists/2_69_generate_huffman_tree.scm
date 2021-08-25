(define (generate_huffman_tree pairs)
  (successive_merge (make_leaf_set pairs)))

(define (succesive_merge leaf_set)
    (define (succesive_merge_rec leaf_set res)
        ; 
        (make_code_tree (car leaf_set) (cdr leaf_set))
    )
    (succesive_merge_rec leaf_set '())
)