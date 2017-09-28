(define (reverse list1)
  (define (reverse-iter new old)
    (if (null? old)
      new
      (reverse-iter (cons (car old) new) (cdr old))))
  (reverse-iter '() list1))
