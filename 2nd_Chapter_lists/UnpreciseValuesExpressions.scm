

(define (blackEnergyDiff r1 r2) 
    (operation "-" r1 r2))

(define (blackEnergyTripleDiff r1 r2 r3) 
    (operation "-" r1 ((blackEnergyDiff r2 r3))))

(define (operation )) ; returns normalized operation

(eval (blackEnergyTripleDiff 1 2 3))

(eval blackEnergyTripleDiff 1 2 3)

r1 - (r2 - r3)

r1 + (-r2) + r3  

CompoundOperation = {
    type: OperationType
    left: Operation,
    right: Operation,

}

Operation = {
    type: OperationType
    left: Number,
    right: Number,
}
