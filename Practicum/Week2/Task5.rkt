#lang racket
(define (palindrome? n)(= n (reverse n)))

(define (reverse n)
  (define (helper result left-over)
    (cond
      [(< left-over 10) (+ (* result 10) left-over)]
      [else (helper (+ (* result 10) (remainder left-over 10))
                    (quotient left-over 10)
                    )]
      )
  )
  (cond
    [(< n 0) (error "n was negative")]
    [else (helper 0 n)]
    )
  )



(palindrome? 2332)
(palindrome? 211)
(palindrome? 232)