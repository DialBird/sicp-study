(define (make-queue) (cons '() '()))
(define (front-ptr queue) (car queue))
(define (rear-ptr queue) (cdr queue))
(define (set-front-ptr! queue item) (set-car! queue item))
(define (set-rear-ptr! queue item) (set-cdr! queue item))
(define (empty-queue? queue) (null? (front-ptr queue)))
(define (front-queue queue)
  (if (empty-queue? queue)
    '()
    (car (front-ptr queue))))
(define (insert-queue! queue item)
  (let ((new-item (cons item '())))
    (if (empty-queue? queue)
      (begin (set-front-ptr! queue new-item)
             (set-rear-ptr! queue new-item))
      (begin (set-cdr! (rear-ptr queue) new-item)
             (set-rear-ptr! queue new-item)))
    queue))
(define (delete-queue! queue)
  (if (empty-queue? queue)
    (error "no elements")
    (if (= (length (front-ptr queue)) 1)
      (begin (set-front-ptr! queue '())
             (set-rear-ptr! queue '()))
      (set-front-ptr! queue (cdr (front-ptr queue)))))
  queue)

; experiments
(define a (make-queue))
(empty-queue? a)
(insert-queue! a 1)
(insert-queue! a 0)
(delete-queue! a)
a
