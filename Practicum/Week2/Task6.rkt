#lang racket
(define (sum-divisors n current)
  (cond
    [(>= current n)]
    [(= (remainder n current) 0) (+ current (sum-divisors n (+ current 1)))]
    [else (sum-divisors n (+ current 1))]
    )
)

(define (perfect? n)
  (cond
    [(< n 1)(error "n is not natural")]
    [(= n 1) #f]
    [else (= n (sum-divisors n 1))]
    )
)

(perfect? 6)