(define (make-accumulator balance)
  (lambda (plus)
    (begin (set! balance (+ balance plus))
           balance)))

(define A (make-accumulator 5))

(A 10)
