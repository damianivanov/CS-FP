#lang racket
(define (starting-zero-count xs)
  (cond
    [(null? xs) 0]
    [(= (car xs) 0) (+ 1 (starting-zero-count (cdr xs)))]
    [else 0]
    ))

(define (triangular? mat)
  (define (helper left-over index)
    (cond
      [(null? left-over) #t]
      [(= (starting-zero-count (car left-over)) index ) (helper (cdr left-over) (+ 1 index)) ] ;>= защото ел. на гл. диагонал и след него също може да са 0
      [else #f]
   ))
    (if (null? mat)
        #f
        (helper mat 0)) ;първият ред на матрицата няма значение
    )
(equal? (triangular? '((-1))) #t)
(equal? (triangular? '((-1 -2 -3) (0 -5 -6) (0 0 -9))) #t)
(equal? (triangular? '((1 2 3) (0 5 6) (0 0 9))) #t)
(equal? (triangular? '((0 2 3) (0 0 6) (1 0 0))) #f)
(equal? (triangular? '((1 2 3) (1 5 6) (0 0 9))) #f)
(equal? (triangular? '((1 2 3 4) (0 5 6 7) (0 0 8 9) (0 0 0 9))) #t)