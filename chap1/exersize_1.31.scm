; a
(define (product a)
  (define (product-iter res n)
    (define (product-iter-term k)
      (* (/ (- k 1) k) (/ (+ k 1) k)))
    (if (> n a)
      res
      (product-iter (* res (product-iter-term n)) (+ n 2))))
  (product-iter 1.0 3))

; b
(define (product_b a cnt)
  (if (> cnt a)
    1.0
    (* (/ (- cnt 1) cnt) (/ (+ cnt 1) cnt)
       (product_b a (+ cnt 2)))))


(product 10001)
(product_b 10001 3)
