#lang racket
(require math/number-theory)

;Task 1
(define (automorphic? n)
 (define (same-last-digits? sqrt n)
    (cond
      [(and (< n 10)
            (= (remainder sqrt 10) (remainder n 10))) #t]
       [(and (same-last-digits? (quotient sqrt 10) (quotient n 10))
            (=(remainder sqrt 10) (remainder n 10))) #t]
      [else #f]
      ))
  
  (cond
    [(<= n 0) (error "n is not natural number")]
    [(same-last-digits? (* n n) n) #t]
    [else #f]
   ))

;Task 2
(define (cube n) (* n n n) )

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
(equal?(automorphic? 3)#f)
(equal?(automorphic? 10)#f)
(equal?(automorphic? 5)#t)
(equal?(automorphic? 25)#t)
(equal?(automorphic? 76)#t) 
(equal?(automorphic? 890625)#t) 
(equal?(automorphic? 625)#t) 
(equal? (automorphic? 36) #f)
(equal? (automorphic? 11) #f)
;(automorphic? -1); -> error

(=(nth-cuban 1)7) ; -> 7 (2^3 - 1^3);
(=(nth-cuban 2)19) ; -> 19(3^3 -2^3)
(=(nth-cuban 4) 61); -> 61 (5^3 - 4^3)
(=(nth-cuban 50) 55897); -> 55897 (137^3 - 136^3)
(=(nth-cuban 100) 283669); -> 283669 (308^3 - 307^3)
;(nth-cuban -1); -> error

