#lang racket


;
(define (fact n)
  (cond
    [(< n 0) (error "n was negative")]
    [(< n 2) 1]
    [else (* n (fact (- n 1)))]
  ))

(define (fact-iter n)
  (define (helper product counter)
    (cond
      
      [(> counter n) product]
      [else (helper (* product counter) (+ counter 1))]
    )
  )
  (cond
    [(< n 0)(error "n was negative")]
    [else (helper 1 1)]
))
(= (fact 11) 39916800)
(= (fact-iter 11) 39916800)
