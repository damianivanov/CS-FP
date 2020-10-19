#lang racket


;
(define (fact n)
  (cond
    [(< n 0) (error "n was negative")]
    [(< n 2) 1]
    [else (* n (fact (- n 1)))]
  ))

(define (fact-iter n)
  (define (fact-it product counter)
    (if (> counter n) product
     (fact-it (* product counter) (+ counter 1)))
  )
  (fact-it 1 1))

(= (fact 11) 39916800)
(= (fact-iter 11) 39916800)
