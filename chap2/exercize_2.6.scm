(define (inc n) (+ n 1))

(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (add-1 zero))
(define one (lambda (f) (lambda (x) (f x))))

(define two (add-1 one))
(define two (lambda (f) (lambda (x) (f ((one f) x)))))
(define two (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))
(define two (lambda (f) (lambda (x) (f (f x)))))

((zero inc) 0)
((one inc) 0)
((two inc) 0)
