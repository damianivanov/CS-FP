#lang racket

(define (replace xs dict)
  (cond
    [(null? xs) xs]
    [(null? (filter (λ (x)(=(car x) (car xs))) dict)) (cons (car xs) (replace (cdr xs) dict))]
    [else (cons (cdar(filter (λ (x)(=(car x) (car xs))) dict)) (replace (cdr xs) dict))]
   ))

(equal? (replace '(1 2 3 4) '((1 . 11) (2 . 22))) '(11 22 3 4))