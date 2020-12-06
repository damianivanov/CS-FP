#lang racket
;(equal? (cdr (cadr '((a (b)) ((c (d)) e)))) '(e))
;(equal? (cons '(a b) (list 'c '((d) e))) '((a b) c ((d) e)))
;(equal? (list '(a b) (list '(c d))) '((a b) ((c d))))
;(append '(a (b c)) (caddr '((a b) c ((d) e))))
;(equal? (append '(a (b c)) '((d) e)) '(a (b c) (d) e))




;(cadddr (append '(a b) (list 'c (list '((d) a b ) '(d)) 'e)))
;'(a b c (((d) a b)(d)) e)
;'((((d) a b)(d)))
(equal? (cadddr (append '(a b) (list 'c (list '((d) a b ) '(d)) 'e))) '(((d) a b)(d)))