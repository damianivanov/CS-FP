#lang racket
;Task2 For Home

;I really don't want to refactor this Task...
;It's hard to read, but it was hard to write also...
(define (longest-ascending-sub xs) 
  (define (helper max curr left-over)
    (cond
      
      [(> (length curr) (length max))
       (helper curr curr left-over)]
      
      [(and (=(length left-over) 1)
            (< (length curr) (length max))) max]
      
      [(=(length left-over) 1)    
       (if (< (car left-over) (car curr))
          max
          (cons (car left-over) curr))]
      
      [(and (not (null? curr))
            (>= (car left-over) (car curr)))
       (helper max (cons (car left-over) curr) (cdr left-over))]
   
      [(< (car left-over) (cadr left-over))
       (helper max (list (car left-over)) (cdr left-over))]
      
      [(and (> (length curr) (length max))
            (> (car curr)(car left-over)));
       (helper curr '() left-over)]
      
      [else (helper max '() (cdr left-over))]
      )
   )
  (if(<= (length xs) 1)
     xs
     (reverse(helper '() '() xs)))
)
;(time (longest-ascending-sub '(1 5 2 3 1 5 6 7 7 1 5)))
(equal? (longest-ascending-sub '()) '())
(equal? (longest-ascending-sub '(1)) '(1))
(equal? (longest-ascending-sub '(1 2 3 1)) '(1 2 3))
(equal? (longest-ascending-sub '(1 0 5)) '(0 5))
(equal? (longest-ascending-sub '(1 5 2 3 1 5 6 7 7 1 5)) '(1 5 6 7 7))
(equal? (longest-ascending-sub '(1 5 2 3 1 5 2 7 7 15)) '(2 7 7 15))
(equal? (longest-ascending-sub '(1 5 2 3 4 5 6 7 7 1 5)) '(2 3 4 5 6 7 7))
(equal? (longest-ascending-sub '(1 5 2 4 6 8 3 4 1)) '(2 4 6 8))