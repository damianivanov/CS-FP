#lang racket
(require math/number-theeory)

(define (sum-digit-divisors n)
  (define (helper left-over sum)
    (cond
      [(and (< left-over 10) (=(remainder (n left-over))0)) (+ sum left-over)]
      [(=(remainder (n (remainder left-over 10)))0)]
      ))
  )



(= (sum-digit-divisors 1) 1)
(= (sum-digit-divisors 28) 2)
(= (sum-digit-divisors 32) 2)
(= (sum-digit-divisors 29) 0)
(= (sum-digit-divisors 34) 0)
(= (sum-digit-divisors 1048) 13)