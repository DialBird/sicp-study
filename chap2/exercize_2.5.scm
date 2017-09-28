(define (cons x y) (* (expt 2 x) (expt 3 y)))

(define (car z)
  (define (car-iter res cur)
    (if (odd? cur)
      res
      (car-iter (+ res 1) (/ cur 2))))
  (car-iter 0 z))

(define (cdr z)
  (define (cdr-iter res cur)
    (if (= (remainder cur 3) 0)
      (cdr-iter (+ res 1) (/ cur 3))
      res))
  (cdr-iter 0 z))

(car (cons 1 2))
(cdr (cons 1 2))
