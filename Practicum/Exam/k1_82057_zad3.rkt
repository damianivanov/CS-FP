#lang racket
(define (shuffle xs)
  (define (helper index n)
    (if(= index n)
       '()
       (append (list (list-ref xs index) (list-ref xs (+ index n))) (helper (+ index 1) n))
       ))
  
  (if (null? xs)
      (error "empty list")
      (helper 0 (/ (length xs) 2))
      )
  )
(shuffle '(2 5 1 3 4 7)) ; -> '(2 3 5 4 1 7)
(shuffle '(1 2 3 4 4 3 2 1)) ; -> '(1 4 2 3 3 2 4 1)
(shuffle '(1 1 2 2)) ; -> '(1 2 1 2)

(shuffle '(2 3 5 4 1 7)) ; -> '(2 4 3 1 5 7)
(shuffle '(1 2 2 2)) ; -> '(1 2 2 2)
(shuffle '()) ;error 