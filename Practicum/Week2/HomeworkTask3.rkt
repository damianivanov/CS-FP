#lang racket

(define (prime? n)
  (define (helper i)
    (cond
      [(= i n) #t]
      [(= (remainder n i) 0) #f]
      [else (helper (+ i 1))]))
  (if (< n 2)
      #f
      (helper 2))
  )

(define (contains? d n)
  (define (helper n)
    (cond
      [(and (= n 0) (not (= d 0))) #f]
      [(=(modulo n 10) d) #t]
      [else (helper (quotient n 10))]
     )
    )
  (helper n))


(define (sum-special-primes n d)
  (define (helper n d count sum current)
    (cond
      [(= count n) sum]
      [(and
        (contains? d current)(prime? current))
       (helper n d (+ count 1) (+ sum current) (+ current 1))]
      [else (helper n d count sum (+ current 1))]
     ))
  (cond
   [(= n 0) 0]
   [else (helper n d 0 0 1)]
   ))

(= (sum-special-primes 5 2) 392)
(= (sum-special-primes 5 3) 107)
(= (sum-special-primes 10 3) 462)
(= (sum-special-primes 2 9) 48)