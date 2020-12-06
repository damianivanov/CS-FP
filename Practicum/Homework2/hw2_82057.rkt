#lang racket
(require math/number-theory)
;Дамян Иванов; фн:82057; гр.3


;Task 1
(define (cartesian-product xs ys)                                                                                                                       
    (if (or (null? xs) (null? ys))                                        
        '()                                                                   
        (cons (cons (car xs) (car ys))                                    
              (append (cartesian-product  (list (car xs)) (cdr ys))                  
                    (cartesian-product  (cdr xs)  ys))))                                                                                                           
        )                                                                     

(equal? (cartesian-product '(1 2) '(3 4)) '((1 . 3) (1 . 4) (2 . 3) (2 . 4)))

(equal? (cartesian-product '(1 2 3 4 5) '(6 7 8)) '((1 . 6) (1 . 7) (1 . 8) (2 . 6)
(2 . 7) (2 . 8) (3 . 6) (3 . 7) (3 . 8) (4 . 6) (4 . 7) (4 . 8) (5 . 6) (5 . 7) (5 . 8)))

(equal? (cartesian-product '(1 2) '(6 7 8 9)) '((1 . 6) (1 . 7) (1 . 8) (1 . 9) (2 . 6) (2 . 7) (2 . 8) (2 . 9)))
(equal? (cartesian-product '(1) '(6 7 8)) '((1 . 6) (1 . 7) (1 . 8)))
(equal? (cartesian-product '(1) '(8)) '((1 . 8)))
(equal? (cartesian-product '(1) '()) '())



;Task 2
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