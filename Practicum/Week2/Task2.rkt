#lang racket

(define (fib n)
  (cond
   ;[(<= n 0) (error "n is negative")]
   [(< n 2) n]
   [else (+ (fib (- n 1)) (fib (- n 2)))]
      )
 )

(define (fib-iter n)
   (define (helper prev current current-indx)
     (cond
      [(= current-indx n) current]
      [else (helper current (+ prev current) (+ current-indx 1))]
    ))
  (cond
   [(<= n 0) (error "n is negative")]
   [else (helper 0 1 1)]
   )
  )



(= (fib 11) 89)
(= (fib-iter 11) 89)
