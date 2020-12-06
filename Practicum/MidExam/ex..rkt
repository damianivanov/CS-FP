#lang racket
 (require racket/trace)
#|Да се дефинира функция (sum-numbers a b), приемаща два аргумента, която
намира сумата на числата в интервала [a,b], чиито цифри са в низходящ (>=) ред.|#

(define (decreasing-digits? a)
  (define (helper curr last-digit)
    (cond
      [(= curr 0) #t]
      [(>= (remainder curr 10) last-digit) (helper (quotient curr 10) (remainder curr 10))]
      [else #f]
      ))
  
  (helper (quotient a 10) (remainder a 10))
)

 (define (sum-numbers a b)
    (define (helper sum curr-number)
      (cond
        [(> curr-number b) sum]
        [(decreasing-digits? curr-number) (helper (+ sum curr-number) (+ curr-number 1))]
        [else (helper sum (+ curr-number 1))]
       ))
    (helper 0 a)
    )
(sum-numbers 1 9) ;→ 45
(sum-numbers 199 203); → 200
(sum-numbers 219 225); → 663