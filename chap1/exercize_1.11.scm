; before

(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                 (* 2 (f (- n 2)))
                 (* 3 (f (- n 3)))))))

; after
(define (f2 n)
  (define (f-iter a b c n)
    (cond ((< n 3) n)
          ((= n 3) (calc a b c))
          (else (f-iter (calc a b c) a b (- n 1)))))
  (define (calc a b c) (+ a (* 2 b) (* 3 c)))
  (f-iter 2 1 0 n))
