; local変数でリストを作る場合はlist関数を使うこと
(define (make-table same-key?)
  (let ((local-table (list 'table)))
    (define (lookup key-1 key-2)
      (let ((subtable (same-key? key-1 (cdr local-table))))
        (if subtable
          (let ((record (same-key? key-2 (cdr subtable))))
            (if record (cdr record) #f))
          #f)))
    (define (insert! key-1 key-2 value)
      (let ((subtable (same-key? key-1 (cdr local-table))))
        (if subtable
          (let ((record (same-key? key-2 (cdr subtable))))
            (if record
              (set-cdr! record value)
              (set-cdr! subtable
                        (cons (cons key-2 value)
                              (cdr subtable)))))
          (set-cdr! local-table
                    (cons (list key-1 (cons key-2 value))
                          (cdr local-table)))))
      local-table)
    (define (dispatch m)
      (cond ((eq? m 'lookup) lookup)
            ((eq? m 'insert!) insert!)
            (else "no mission")))
    dispatch))

(define (same-key? key table)
  (cond ((null? table) #f)
        ((eq? key (caar table)) (car table))
        (else (same-key? key (cdr table)))))

(define t1 (make-table same-key?))
((t1 'insert!) 'a 'b 'c)
((t1 'insert!) 'd 'e 'f)
((t1 'lookup) 'd 'e)
