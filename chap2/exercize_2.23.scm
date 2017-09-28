(define (for-each proc lis)
  (if (null? lis) '()
    (begin 
      (newline)
      (display (proc (car lis)))
      (for-each proc (cdr lis)))))

(for-each even? (list 1 2 3 -4))
