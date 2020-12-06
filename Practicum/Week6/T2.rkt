#lang racket
(define (remove-all n xs)
  (filter (λ (y) (not (= n y))) xs)
  )

(remove-all 1 '(1 1 1 2))
     (remove-all 1 '(2 5 6))
     (remove-all 1 '(1))
     (remove-all 1 '(1 2 1 1))