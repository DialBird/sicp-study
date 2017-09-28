(define x '(1 3 (5 7) 9))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (s)
                     (if (pair? s)
                       (count-leaves s)
                       1))
                   t)))
