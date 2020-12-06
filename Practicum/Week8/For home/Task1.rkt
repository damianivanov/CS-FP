#lang racket

(define (diagonal xss)
  (define (helper matrix-left-over row)
    (if (or (null? matrix-left-over) (>= row (length (car matrix-left-over))))
        '()
        (append (list (list-ref (car matrix-left-over) row)) (helper (cdr matrix-left-over) (+ row 1)))
     ))

  (helper xss 0)
  )


(equal? (diagonal '((1 2 3 4) (5 6 7 8) (9 10 11 12) (13 14 15 16))) '(1 6 11 16))
;not NxN matrixes 
(equal? (diagonal '((1 2 3) (4 5 6) (7 8 9) (10 11 12))) '(1 5 9))
(equal? (diagonal '((1 2 3 4) (5 6 7 8) (9 10 11 12))) '(1 6 11))
;wrong input
(equal? (diagonal '(() () ()) ) '())
(equal? (diagonal '(()) ) '())
(equal? (diagonal '() ) '())