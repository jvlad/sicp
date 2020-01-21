
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

; Complexity analysis

let n = board-size  

(map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
    (enumerate-interval 1 board-size))
Time = n

let Time of (qeen-cols k) = T(k) == T(k - 1) + Q(k - 1)*n ==
T(k - 2) + Q(k - 2)*n + Q(k - 1)*n == 
n*(Q(1) + Q(2) + ... + Q(k-1)) 

Since Q(k) will grow till some k and then decrease, we can say there is some 
max(Q(1), Q(2), ..., + Q(k-1)).

let C(n) = max(Q(1), Q(2), ..., + Q(k-1)) 
then 
n*(Q(1) + Q(2) + ... + Q(k-1)) ~= n * k * C(n)
T(n) ~= n^2 * C(n)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))

; Complexity analysis
let T1(k) = Time of (queen-cols k)
let n = board-size
T1(k) =  n * (T1(k-1) + Q(k-1)) == n * (T1(k-1) + C(n)) 
== n * (n*T1(k-2) + n*C(n) + C(n)) == 
== n*n*(n * (T1(k-3) + C(n))) + n*n*C(n) + n*C(n)
== n*n*(n*T1(k-3) + n*C(n)) + n*n*C(n) + n*C(n)
== n^3*T1(k-3) + n^3*C(n) + n^2*C(n) + n*C(n)
== n^k + n^k*C(n) + n^(k-1)*C(n) ... n*C(n)  
== n^(k + 1)*C(n)

T1(n) = n^(n + 1)*C(n) = n^n * n * C(n)  

T1(8)/T(8) = 8^9/8^2 = 8^7

T1(8) is about 8^7 slower than T(8)  

