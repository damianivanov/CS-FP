#lang racket
;Task3
(define (tabulate f)
  (λ (a b) (map (λ (x) (cons x (f x)) ) (range a (+ b 1))))
  )

(equal? ((tabulate (λ (x) (* x x))) 1 5) '((1 . 1) (2 . 4) (3 . 9) (4 . 16) (5 . 25)))