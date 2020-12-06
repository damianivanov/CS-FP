#lang racket

(require math/number-theory)
(define (cube n) (* n n n) )

;(n+1)^3 - n^3
(define (cub-func n) (- (cube n) (cube (- n 1)))) 

(define (nth-cuban n)
  (define (helper x counter)
    (cond
      [(= counter n) (cub-func (- x 1))] 
      [(prime? (cub-func x)) (helper (+ x 1) (+ counter 1))];
      [else (helper (+ x 1) counter)]
     ))
  
  (if(< n 0)
     (error "n should be natural number")
     (helper 1 0)
   ))

(time(nth-cuban 100)) ; -> 7 (2^3 - 1^3)
;(nth-cuban 2) ; -> 19(3^3 -2^3)
;(nth-cuban 4) ; -> 61 (53 - 43)
;(nth-cuban 50) ; -> 55897 (1373 - 1363)
;(nth-cuban 100) ; -> 283669 (3083 - 3073)