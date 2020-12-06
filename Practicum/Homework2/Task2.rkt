#lang racket
(require math/number-theory)

(define (factorize n)
  (define (helper curr-del left-over)
    (cond
      [(= left-over 1) '()]
      [(and (prime? curr-del) (= (remainder left-over curr-del)0))
       (append (list curr-del) (helper curr-del (/ left-over curr-del)))]
      [else (helper (+ curr-del 1) left-over)]
     ))

  
  (if (<= n 1)
      (error "n should be more than 1")
      (helper 2 n)
      )
  )
;(factorize 1) ;error
;(factorize -1) ;error
(equal? (factorize 6) '(2 3))
(equal? (factorize 13) '(13))
(equal? (factorize 123) '(3 41))
(equal? (factorize 152) '(2 2 2 19))

(equal? (factorize 131313) '(3 7 13 13 37))
(equal? (factorize 42069) '(3 37 379))
(equal? (factorize 12345) '(3 5 823))