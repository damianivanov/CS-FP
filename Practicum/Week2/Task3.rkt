#lang racket
(define (prime? n)
  (define (helper current-divisor)
    (cond
      [(>= current-divisor n) #t]
      [(= (remainder n current-divisor)0)]
      [else (helper (+current-divisor 1))]
     )
    )
  (cond
    [(<= n 0) (error "n was not natural")]
    [else] ...
    )
  

(equal? (prime? 1) #f)
(equal? (prime? 2) #t)
(equal? (prime? 3) #t)
(equal? (prime? 6) #f)
(equal? (prime? 61) #t)
