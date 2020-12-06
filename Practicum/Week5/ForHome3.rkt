#lang racket

(define (set-union xs ys)
  (cond
    [(null? xs) (sort ys <)]
    [(null? ys) (sort xs <)]
    [(member (car ys) xs) (set-union xs (cdr ys))]
    [else (set-union (cons (car ys) xs) (cdr ys))]
   ))

(equal? (set-union '(1 3 5 7) '(5 7 13)) '(1 3 5 7 13))
(equal? (set-union '(5 7 13) '(1 3 5 7)) '(1 3 5 7 13))
(equal? (set-union '() '(3 5 13)) '(3 5 13))
(equal? (set-union '(3 5 13 7) '(3)) '(3 5 7 13))
(not (equal? (set-union '(1) '(1)) '(1 1)))
(not (equal? (set-union '() '(1)) '()))