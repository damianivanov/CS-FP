#lang racket
(define (repeater str)
  (λ (count glue)
    (if(= count 1)
       str
       (string-append str glue ((repeater str) (- count 1) glue ))
       )))
((repeater "I love Racket") 3 " ")
(equal? ((repeater "I love Racket") 3 " ") "I love Racket I love Racket I love Racket")
(equal? ((repeater "Quack") 5 "!") "Quack!Quack!Quack!Quack!Quack")