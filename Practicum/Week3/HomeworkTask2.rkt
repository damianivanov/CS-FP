#lang racket
(define (p n)
  (define (helper index prev-n)
    (cond
      [(= index 1) (helper (+ index 1) 1)]
      [(> index n) prev-n]
      [else (helper (+ index 1) (+ prev-n (- (* 3 index) 2)) )]
     )
    )
  
  (if (< n 1)
      (error "n should be natural number")
      (helper 1 0)
   )
  )

(= (p 1) 1)
(= (p 2) 5)
(= (p 3) 12)
(= (p 4) 22)
(= (p 5) 35)
(= (p 6) 51)
(= (p 7) 70)
(= (p 8) 92)
(= (p 9) 117)
(= (p 10) 145)
