#lang racket

(define (reverse-number n)
  (define (helper left-over result)
    (if (< left-over 10)
        (+ (* result 10) left-over)
        (helper (quotient left-over 10) (+ (* result 10) (remainder left-over 10)))
        )
    )
  (helper n 0)
  )

(define (palindrome? n)
  (if (< n 0)
      (error "n was negative")
      (= n (reverse-number n))
      )
  )
(define (num-palindromes a b)
  (define (helper a b count current)
    (cond
      [(> current b) count]
      [(palindrome? current) (helper a b (+ count 1) (+ current 1))]
      [else (helper a b count (+ current 1))]
     ))
  (cond
    [(> a b) (helper b a 0 b)]
    [else (helper a b 0 a)]
   )
  )
(= (num-palindromes 1 101) 19)
(= (num-palindromes 1 100) 18)
(= (num-palindromes 100 1) 18)
(= (num-palindromes 100 2000) 100)