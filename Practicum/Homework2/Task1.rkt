#lang racket        
(define (cartesian-product xs ys)                                                                                                                       
    (if (or (null? xs) (null? ys))                                        
        '()                                                                   
        (cons (cons (car xs) (car ys))                                    
              (append (cartesian-product  (list (car xs)) (cdr ys))                  
                    (cartesian-product  (cdr xs)  ys))))                                                                                                           
        )                                                                     

(cartesian-product '(1 2) '(3 4))
(equal? (cartesian-product '(1 2) '(3 4)) '((1 . 3) (1 . 4) (2 . 3) (2 . 4)))

(equal? (cartesian-product '(1 2 3 4 5) '(6 7 8)) '((1 . 6) (1 . 7) (1 . 8) (2 . 6)
(2 . 7) (2 . 8) (3 . 6) (3 . 7) (3 . 8) (4 . 6) (4 . 7) (4 . 8) (5 . 6) (5 . 7) (5 . 8)))

(equal? (cartesian-product '(1 2) '(6 7 8)) '((1 . 6) (1 . 7) (1 . 8) (2 . 6) (2 . 7) (2 . 8)))