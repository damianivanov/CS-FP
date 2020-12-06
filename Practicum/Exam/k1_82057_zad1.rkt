#lang racket
(require math/number-theory)

(define (digit-count n)
  (if(= n 0)
     0
     (+ 1 (digit-count (quotient n 10)))
     ))

(define (dig-pow n p)
  (define (helper left-over digits-left)
    (if(= left-over 0)
       0
       (+ (expt (remainder left-over 10) digits-left) (helper (quotient left-over 10) (- digits-left 1)))))
  
  (if(< n 0)
     (error "n has to be natural")
     (if (divides? n (helper n (+ (digit-count n) (- p 1))))
         (/ (helper n (+ (digit-count n) (- p 1))) n)
         -1
     )))


(dig-pow 89 1) ; -> 1 (8^1 + 9^2 = 89 = 89 * 1)
(dig-pow 92 1) ; -> -1 (няма k – такова, че 9^1 + 2^2 = 92 * k)
(dig-pow 695 2) ; -> 2 (6^2 + 9^3 + 5^4 = 1390 = 695 * 2)
(dig-pow 46288 3) ; -> 51 (4^3 + 6^4 + 2^5 + 8^6 + 8^7 = 2360688 =46288 * 51)
(dig-pow -1 2) ;error