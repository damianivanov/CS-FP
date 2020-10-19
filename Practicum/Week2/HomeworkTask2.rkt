#lang racket

(define (sum-divisors current n)
    (cond
      [(>= current n) 0]
      [(= (remainder n current) 0) (+ current (sum-divisors (+ current 1) n))]
      [else (sum-divisors (+ current 1) n)]
     )
    )
(define (amicable? a b)
  (cond
    [(=(sum-divisors 1 a) b) #t]
    [(=(sum-divisors 1 b) a) #t]
    [else #f]
   ))

(equal? (amicable? 200 300) #f)
(equal? (amicable? 220 284) #t)
(equal? (amicable? 284 220) #t)
(equal? (amicable? 1184 1210) #t)
(equal? (amicable? 2620 2924) #t)
(equal? (amicable? 6232 6368) #t)