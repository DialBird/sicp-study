(define (make-leaf symbol weight) (list 'leaf symbol weight))

(define (leaf? object) (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left)
                (symbols right))
        (+ (weight left)
           (weight right))))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (make-leaf-set pairs)
  (define (adjoin-set x set)
    (cond ((null? set) (list x))
          ((< (weight x) (weight (car set)))
           (cons x set))
          (else (cons (car set) (adjoin-set x (cdr set))))))
  (if (null? pairs) '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
                  (make-leaf-set (cdr pairs))))))

(define (successive-merge set)
  (if (= (length set) 1)
    (car set)
    (let ((sorted-set (sort set (lambda (x y) (< (weight x) (weight y))))))
      (successive-merge
        (cons (make-code-tree (car sorted-set) (cadr sorted-set))
              (cddr sorted-set))))))

(define (generate-haffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(generate-haffman-tree '((A 4) (B 2) (C 2) (D 4) (E 6)))
(generate-haffman-tree '((A 2) (GET 2) (SHA 3) (WAH 1) (BOOM 1) (JOB 2) (NA 16) (YIP 9)))
