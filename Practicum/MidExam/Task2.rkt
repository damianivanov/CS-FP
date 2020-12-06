#lang racket
(require racket/trace)

(define (bigger-elements xs x)
  (cond
    [(null? xs) 0]
    [(< x (car xs)) (+ 1 (bigger-elements (cdr xs) x))]
    [else (bigger-elements (cdr xs) x)]
   ))

(define (num-bigger-elements xs)
  (define (helper left-over)
    (cond
      [(null? left-over) '()]
      [else (append (list (cons (car left-over) (bigger-elements xs (car left-over)))) (helper (cdr left-over)))]
      )
    )
  (helper xs))

(num-bigger-elements '(5 6 3 4)); → '((5 1) (6 0) (3 3) (4 2))
(num-bigger-elements '(1 1 1)); → '((1 0) (1 0) (1 0))
