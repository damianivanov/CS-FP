#lang racket
 (require racket/trace)

;For Home

(define (repeater str) ; str - string
  (λ (n del) ;del - delimiter
    (if (= n 1)
        str
        (string-append str del ((repeater str) (- n 1) del))
    )))

(equal? ((repeater "Quack") 5 "!") "Quack!Quack!Quack!Quack!Quack")
(equal? ((repeater "Hi") 4 "!!") "Hi!!Hi!!Hi!!Hi") 
(equal? ((repeater "I love Racket") 3 " ") "I love Racket I love Racket I love Racket")
