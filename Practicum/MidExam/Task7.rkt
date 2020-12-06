#lang racket
(define (where ls lp)
  (if(null? lp)
     ls
     (where (filter (car lp) ls) (cdr lp))))

(where '(3 4 5 6 7 8 9 10) (list even? (lambda (x) (> x 5)))) ;(6 8 10)
(where '(3 4 5 7) (list even? (lambda (x) (> x 5)))) ;→ ()