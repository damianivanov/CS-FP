#lang racket
;subtask 1
(sort '("str" "banana" "apple" "fruit" "za")
      (λ (x y) (< (string-length x) (string-length y)))
      )
;subtask 2

(define (my-length xs)
  (if (null? xs) 0
      (+ 1 (my-length (cdr xs)))))

;(my-length `(1 2 3 4 5 6))

;Task 2
(define (elem? x xs)
  (cond
    [(null? xs) #f]
    [(equal? (car xs) x) #t] 
    [else (elem? x (cdr xs))]
    ) 
 )

(equal? (elem? 1 '(5 2 1)) #t)
(equal? (elem? "str" '()) #f)
(equal? (elem? "str" '("str" "len" "pair")) #t)
(list? (member 1 '(5 2 1)))