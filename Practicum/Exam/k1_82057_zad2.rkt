#lang racket
(define (kth-max-min xs)
  (λ (k) (if(< k 1)
            (error "k has to be natural")
            (if(>= (list-ref (sort (remove-duplicates xs) <) (- k 1)) 0 )
               ("No such number")
               (list-ref (sort (remove-duplicates xs) <) (- k 1))
               ))))

((kth-max-min '(1 2 3 4 -5 6 7 -2 -1 0)) 2) ; -> -2
((kth-max-min '(-1 0 -1 0 -2 3 1 -1)) 3) ; -> No such number
(((kth-max-min '(1 2 3 4 -5 6 7 -2 -1 0)) 0));error