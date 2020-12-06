#lang racket
(define (switchsum f g n)
  (define (helper index prev sum)
      (cond
      [(= n index) sum]
      [(odd? index) (helper (+ index 1) (f prev) (+ sum  prev))]
      [else (helper (+ index 1) (g prev) (+ sum prev))]
      )    
    )
  (λ (x) (helper 0 (f x) 0))
  )

((switchsum (lambda (x) (+ x 1)) (lambda (x) (* x 2)) 1) 2); → 3
((switchsum (lambda (x) (+ x 1)) (lambda (x) (* x 2)) 2) 2);→ 9
((switchsum (lambda (x) (+ x 1)) (lambda (x) (* x 2)) 3) 2);→ 16
((switchsum (lambda (x) (+ x 1)) (lambda (x) (* x 2)) 4) 2); → 30