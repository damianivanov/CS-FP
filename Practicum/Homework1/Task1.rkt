#lang racket

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


(automorphic? 5) ; -> #t
(automorphic? 25) ; -> #t
(automorphic? 76) ; ->#t
(automorphic? 890625) ; -> #t
(automorphic? 625) ; -> #t

(automorphic? 624) ; -> #f
(automorphic? 36) ; -> #f
(automorphic? 7) ;->#f

