; letをつかうならlambda
(define (make-monitored f)
  (let ((cnt 0))
    (lambda (x)
      (cond
        ((eq? x 'how-many-calls?) cnt)
        ((eq? x 'reset-count) (set! cnt 0))
        (else (begin (set! cnt (+ cnt 1))
                     (f x)))))))


; defineで定義する型
(define (make-monitored f)
  (define cnt 0)
  (define (reset) (set! cnt 0))
  (define (exec m) (begin (set! cnt (+ cnt 1))
                          (f m)))
  (define (dispatch m)
    (cond
      ((eq? m 'how-many-calls?) cnt)
      ((eq? m 'reset-count) (reset))
      (else (exec m))))
  dispatch)

(define s (make-monitored sqrt))

(s 'how-many-calls?)
(s 'reset-count)
(s 10)
