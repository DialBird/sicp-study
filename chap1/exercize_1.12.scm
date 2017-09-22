; m列目にあるn個目の数
(define (pascal-tri m n)
  (cond ((< m n) 0)
        ((or (= n 1) (= n m)) 1)
        (else (+ (pascal-tri (- m 1) (- n 1)) (pascal-tri (- m 1) n)))))

(pascal-tri 11 6)
