(define (check-loop x)
  (define addlist '())
  (define (iter x)
    (cond ((not (pair? x)) #f)
          ((memq x addlist) #t)
          (else (set! addlist (cons x addlist))
                (or (iter (car x))
                    (iter (cdr x))))))
  (iter x))

(define x
  (let ((p '(1 2 3)))
    (set-cdr! (last-pair p) p)
    p))

(define y '(1 2 3))

(define z
  (let ((p '(1 2 3)))
    (set-cdr! (last-pair p) p)
    (list 1 p 2 3)))


(check-loop x)
;#t
(check-loop y)
;#f
(check-loop z)
;#t
