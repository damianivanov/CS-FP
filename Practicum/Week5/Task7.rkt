#lang racket
(define (concat xs ys)
  (define (helper add-to get-from)
    (if(null? get-from)
       (reverse add-to)
       (helper (cons (car get-from) add-to) (cdr get-from))
       )
    )
  (helper (reverse xs) ys)
)

(equal? (concat '(1 2 3) '(4 5 6)) '(1 2 3 4 5 6))

