#lang racket
 (require racket/trace)

(define (desc-order? n)
  (define (helper last-digit left-over)
    (cond
      [(and(<= left-over 9) (>= left-over last-digit)) #t]
      [(>= (remainder left-over 10) last-digit) (helper (remainder left-over 10) (quotient left-over 10)) ]
      [else #f]
   ))

  (if(< n 1)
  (error "n has to be natural number")
  (helper (remainder n 10) n)
  ))

(define (sum-numbers a b)
  (define (helper sum current)
    (cond
      [(> current b) sum]
      [(desc-order? current) (helper (+ sum current)(+ 1 current))]
      [else (helper sum (+ current 1))]
     ))
 
  (if(>= a 1)
     (helper 0 a)
     (error "a < 1")
     )
  
  )

(sum-numbers 1 9) ;→ 45
(sum-numbers 199 203) ;→ 200
(sum-numbers 219 225) ;→ 663
