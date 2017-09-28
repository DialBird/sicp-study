(square-tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))
(define (square-tree lis)
  (cond
    ((null? lis) '())
    ((not (pair? lis)) (square lis))
    (else (cons (square-tree (car lis))
                (square-tree (cdr lis))))))


(define (square-tree lis)
  (map (lambda (node)
         (if (pair? node)
           (square-tree node)
           (square node)))
       lis))
