(define (make-account balance password)
  (define err-count 0)
  (define (withdraw amount)
    (if (<= amount balance)
      (begin (set! balance (- balance amount)) balance)
      "Insufficient"))
  (define (deposit amount)
    (begin (set! balance (+ balance amount)) balance))
  (define (incorrect-password m)
    (set! err-count (+ err-count 1))
    (if (<= 7 err-count)
      (call-the-cops)
      "Incorrect password"))
  (define (call-the-cops) "call the police!!")
  (define (dispatch m input)
    (if (eq? password input)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            (else (error "Unknown request" m)))
      incorrect-password))
  dispatch)

(define acc (make-account 100 'secret-password))

((acc 'deposit 'secret-password) 50)