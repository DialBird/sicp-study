(define (sum term a next b)
  (define (sum-iter res a b)
    (if (> a b)
      res
      (sum-iter (+ (term a) res) (next a) b)))
  (sum-iter 0 a b))
