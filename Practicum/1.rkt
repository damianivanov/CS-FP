#lang racket

;Задача 1
(define (square x) (* x x))

;Задача 2
;(define (myMin a b)(if (< a b) a b))

;Задача 3
;(define (myMinSquare a b) (square (myMin a b)))

;Задача 4
;(define (sumCubes a b) (+ (* a (square a))(* b (square b))))

;Задача 5
;(define (inside? x a b) (if(and (<= x b) (>= x a)) 1 0))

;Задача 6
;(define (squaresAvarage a b) (/ (+ (square a) (square b)) 2))

;Задача 7
;(define (fact n) (if (= n 0) 1 (* n (fact (- n 1)))))

;-----------------------------------------------------------
;Зад.1
(define (smaller a b) (if (< a b) a b))

;Зад.2
(define (average a b) (/ (+ a b) 2))

;Зад.3
(define (cube a) (* a a a))
(define (sumCubes a b) (+ (cube a)(cube b)))
;(= (sumCubes -5 -13) -2322)

;Зад.4
(define (squaresAvarage a b) (/ (+ (square a) (square b)) 2))
;(squaresAvarage 5 20)

;Зад.5
(define (inside? x a b) (if(and (<= x b) (>= x a)) 1 0))
;(inside? 1 0 10)

;Зад.6
(define (leap-year? n)
             (cond
                  [(= (modulo n 400) 0) #t]
                  [(= (modulo n 100) 0) #f]
                  [(= (modulo n 4) 0) #t]
                  [else #f]))

;(display "\nUsing cond\n")
;(equal? (leap-year? 2020) #t)
;(equal? (leap-year? 1988) #t)
;(equal? (leap-year? 1600) #t)
;(equal? (leap-year? 2400) #t)
;(equal? (leap-year? 2023) #f)
;(equal? (leap-year? 1700) #f)
;(equal? (leap-year? 1800) #f)
;(equal? (leap-year? 2100) #f)

(define (leap-year-one-line? n)
  (if (or (= (modulo n 400) 0)
          (and (= (modulo n 4) 0) (not (= (modulo n 100) 0)))) #t #f))

;(display "\nUsing boolean logical operators\n")
;(leap-year-one-line? 2020)
;(leap-year-one-line? 1988)
;(leap-year-one-line? 1600)
;(leap-year-one-line? 2400)
;(leap-year-one-line? 2023) 
;(leap-year-one-line? 1700) 
;(leap-year-one-line? 1800) 
;(leap-year-one-line? 2100)

;Зад.7
(define (my-fact n) (if (= n 0) 1 (* n (my-fact (- n 1)))))
;(= (my-fact 11) 39916800)
;(define (my-fact-iter n) ())

;Homework
(define (my-gcd x y ) (cond
         [(= x 0) y]
         [(= y 0) x]
         [(> x y) (gcd y (- x y))]
         [(< x y) (gcd x (- y x))]
         [else x]))

(display "\nTest cases for GCD\n")
(= (my-gcd 13 13) 13)
(= (my-gcd 624129 2061517) 18913)
(= (my-gcd 37 600) 1)
(= (my-gcd 20 100) 20)
(= (my-gcd 5 13) 1)
(= (my-gcd 13 1235) 13)