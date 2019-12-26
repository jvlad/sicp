val zero = { f -> { x -> x } }

val s = f -> a -> b -> (2 * b * a - f)
(f -> a -> b -> (2 * b * a - f)) x1 x2 x3

val r1 = zero(a) == {x -> x}
val r2 = r1(b) == b
((zero a) b) == b


val zero = a -> b -> b

// (define (add-1 n)
//   (lambda (f) (lambda (x) (f ((n f) x)))))

val add_1 = n -> f -> x -> f (n f x)
val one = f -> x -> f x

one = a -> b -> a b
add_1 one = f -> x -> f (f x)

val two = f -> x -> f (f x)

add_1 two = f -> x -> f (f (f x))
val three = f -> x -> f (f (f x))

val two = a -> b -> a (a b)
// three two = x -> f -> (f (b -> x (x b)))

n2 = a -> b -> ...
val sum = n1 -> n2 -> f -> x -> n1 f (n2 f x)

j: x -> x^2
h: a -> j a

sum two three = f -> x -> f (f (f (f (f x))))

sum two three = f -> x -> two f (tree f x) =
    f -> x -> two f (f (f (f x))) = f -> x -> f (f (f (f (f x))))

(define (sum a b)
    (lambda (f) 
        (lambda (x) ((b f) x))))

((sum one n)
    (lambda (f) 
        (lambda (x) ((m f) ((n f) x))) s) t)

       ((m f) ((n f) x))

(sum zero n) equals  
    (lambda (f) 
        (lambda (x) ((n f) x)))
    
(((sum zero n) s) t)
((lambda (x) ((n s) x)) t)
((n s) t)
...
(s (s (s (s t))

f(x) = x * x

g(z) = f(z)  


(define (mult a b)
    (lambda (f) 
        (lambda (x) ((a (b f)) x)))

    b == 1
    (lambda (f) 
        (lambda (x) ((a f) x)))

    b == 2
    (lambda (f) 
        (lambda (x) ((b (a f)) x)))

        (lambda (f) 
            (lambda (x) ((b g) x)))

            b=5
            (g (g (g (g (g x)))))

(define (sum a b)
    (lambda (f) 
        (lambda (x) ((a f) ((b f) x)))))  

f -> f x