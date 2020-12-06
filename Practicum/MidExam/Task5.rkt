#lang racket
 (require math/number-theory)
(define (sum-digits n)
  (if(<= n 0)
     0
     (+(remainder n 10) (sum-digits (quotient n 10)))
))

(define (sum-sum-digit a b k)
  (define (helper current sum)
    (cond
      [(> current b) sum]
      [(divides? k (sum-digits current)) (helper (+ 1 current) (+ sum (sum-digits current)))]
      [else (helper (+ current 1) sum)]
     ))
  
  (if(< a 0)  
     (error "a has to natural")
     (helper a 0)
   ))

(equal? (sum-sum-digit 1 10 2) 20)
