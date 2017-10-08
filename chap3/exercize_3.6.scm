(define (rand-update x)
  (let ((a 11) (b 13) (m 113))
    (modulo (+ (* a x) b) m)))

; Version1 引数を渡す直前の状態を変数に格納して、実行していかないと更新されない
(define (rand)
  (define x 7)
  (lambda (m)
    (cond ((eq? m 'generate) (set! x (rand-update x)) x)
          ((eq? m 'reset) (set! x 7) x)
          (else "unknown"))))

(define myran (rand))
(myran 'generate)
(myran 'reset)


; Version2 これなら最初から引数を渡す直前の関数が格納されている
(define rand
  (let ((x 7))
    (lambda (symbol)
      (cond ((eq? symbol 'generate) (set! x (rand-update x)) x)
            ((eq? symbol 'reset) (lambda (new-value) (set! x new-value) x))
            (else "unknown")))))

(define rand
  (let ((x 7))
    (define (generate) (set! x (rand-update x)))
    (define (reset new-ini) (set! x (rand-update new-ini)))
    (define (dispatch m)
      (cond ((eq? m 'generate) (generate))
            ((eq? m 'reset) reset)
            (else "unknown")))
    dispatch))

(rand 'generate)
((rand 'reset) 11)
