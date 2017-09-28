(define (subsets a)
  (if (null? a)
    (list '())
    (let ((rest (subsets (cdr a))))
      (append rest (map 
                     (lambda (node)
                       (cons (car a) node))
                     rest)))))
(subsets '(1 2 3))
