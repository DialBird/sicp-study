(define (last-pair list1)
  (if (= 1 (length list1))
    (car list1)
    (last-pair (cdr list1))))
