; フロイトの循環検出法
; 枝分かれした先の循環は無理なようだ

(define (froit-loop-check x)
  (define (iter x0 x1)
    (cond ((eq? x0 x1) #t)
          ((null? (cdr x1)) #f)
          ((null? (cddr x1)) #f)
          (else (iter (cdr x0) (cddr x1)))))
  (if (and (pair? x) (pair? (cdr x)))
    (iter (cdr x) (cddr x))
    #f))

(define x
  (let ((p '(1 2 3)))
    (set-cdr! (last-pair p) p)
    p))

(define y '(1 2 3))

(define z
  (let ((p '(1 2 3)))
    (set-cdr! (last-pair p) p)
    (list 1 p 2 3)))

(froit-loop-check x)
(froit-loop-check y)
(froit-loop-check z)
