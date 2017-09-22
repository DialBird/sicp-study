(define (smallest-deviser n)
  (define (smallest-deviser-iter n cur)
    (cond ((= (remainder n cur) 0) cur)
          ((< n (square cur)) 1)
          (else (smallest-deviser-iter n (+ cur 1)))))
  (smallest-deviser-iter n 2))

(smallest-deviser 19999)
