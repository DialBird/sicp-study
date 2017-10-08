(define (or-gate a1 a2 output)
  (define (logical-or x y)
    (cond ((and (= x 0) (= y 0)) 0)
          ((or (= x 1) (= y 1)) 1)
          (else "Invalid")))
  (define (or-action-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2))))
      (after-delay
        or-gate-delay
        (lambda () (set-signal! output new-value)))))
  (add-action! a1 or-action-procedure)
  (add-action! a2 or-action-procedure)
  'ok)
