#lang racket

#|Да се дефинира функция (num-bigger-elements lst), която за даден списък от
числа lst връща като резултат списък с елементи от вида (lsti ni), където lsti е i-тият
елемент на lst, а ni е броят на елементите на lst, които са по-големи от lsti.

;iterative
(define (larger list x)
  (define (helper list count)
    (cond
      [(null? list) count]
      [(> (car list) x) (helper (cdr list) (+ count 1))]
      [else (helper (cdr list) count)]
     )   
    )
  (helper list 0)
  )

|#

(define (larger list x)
    (cond
      [(null? list) 0]
      [(> (car list) x) (+ 1 (larger (cdr list) x))]
      [else (larger (cdr list) x)]
     )   
  )
(define (num-bigger-elements l)
  (define (helper lst result)
   (if(null? lst)
      result
      (helper (cdr lst) (cons (list (car lst) (larger l (car lst))) result))
    ))
  (reverse (helper l '()))
  )

(equal? (num-bigger-elements '(5 6 3 4)) '((5 1) (6 0) (3 3) (4 2)))
(equal? (num-bigger-elements '(1 1 1)) '((1 0) (1 0) (1 0)))
