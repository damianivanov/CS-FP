#lang racket

;Задача 1
;((λ (x) (* 2 x)) 2)

;Задача 2
;((λ (g a b) (-(g b)(g a))) (λ (x) (* 2 x)) 4.5 5.5)

;Задача 3
#|
(define (apply-n f n)
  (if (= n 1)
      (λ (x)(f x))
      (λ (x)(apply-n f (- n 1)) (f x))
      )
  )
((apply-n (λ (x) (* 2 x)) 5) 2)
(= ((apply-n (λ (x) (quotient x 10)) 2) 100) 1)

;Задача 4

(define (switch-sum f g n)
  (λ (x) (if (= n 1)
             (f x)
             (+ (f x) ((switch-sum g f (- n 1)) (f x)))
             ))
  )
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 1) 2) 3)
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 2) 2) 9)
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 3) 2) 16)
(= ((switch-sum (λ (x) (+ x 1)) (λ (x) (* x 2)) 4) 2) 30)


;Task 6


(define (derive f eps)
  (λ (a) (/ (-((f (+ a eps))) (f a)) eps))
  )

(define (deriveN f n eps)
  (if (= n 0)
      f
      (deriveN (derive f eps) (- n 1) eps))
  )

(= ((deriveN (λ (x) (* 2 x x x)) 3 1e-3) 2) 12.000015203739167)
|#

;Task 7
(define (derive-x f eps)
  (λ (x y) (/ (-(f (+ x eps) y) (f x y)) eps))
  )

(define (derive-y f eps)
  (λ (x y) (/ (-(f x (+ y eps)) (f x y)) eps))
  )

(define (g x y) (+ (* x x x) (* x y) (* y y)))
(= ((derive-x g 0.0001) 2 3) 15.000600010033338)
(= ((derive-y g 0.0001) 2 3) 8.00009999998963)