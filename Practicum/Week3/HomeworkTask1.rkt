#lang racket
(require racket/trace)

(define (custom-expt base power)
  (if ( = power 0)
      1
      (* base (custom-expt base (- power 1)))
      ))

(define (calc-series-sum x n)
  (define (helper sum index prev-dеnominator)
    (cond
   [(= index 0) (helper (+ sum -2) (+ index 1) 1)]
   [(< n index) sum]
   [else (helper (+ sum (*
                         (/ (* (expt 2 (+ index 1)) (expt x index) )
                              (* prev-dеnominator
                                 (+ (* 2 index) 1)))
                           (custom-expt -1 (+ index 1)))
                           )
                 (+ index 1)
                 (* prev-dеnominator (+(* 2 index ) 1)))]      
     );малък ужас
    )
  (if (< n 0)
      (error "n should be natural number")
      (helper 0 0 1)
  ))
(calc-series-sum 1 0) ; -2
(calc-series-sum 1 1) ; -2/3
(calc-series-sum 1 2) ; -1 1/5
(calc-series-sum 1 3) ; -1 1/21
(calc-series-sum 1 4) ; -1 11/135
(calc-series-sum 1 5) ; -1 29/385
(calc-series-sum 1 6) ; -1 937/12285