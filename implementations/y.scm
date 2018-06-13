(define Y-com
  (lambda (improver)
    ((lambda (f) (f f))
     (lambda (f) (improver (lambda (x) ((f f) x)))))))

(define fac-improver
  (lambda (partial)
    (lambda (n) (if (= n 1)
                    1
                    (* n (partial (- n 1)))))))

(define fib-improver
  (lambda (partial)
    (lambda (n) (if (< n 2)
                    1
                    (+ (partial (- n 1)) (partial (- n 2)))))))

(define fac
  (lambda (n)
    ((Y-com fac-improver) n)))

(define fib
  (lambda (n)
    ((Y-com fib-improver) n)))
