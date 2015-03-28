#lang racket
(define (same-parity . l)
        (let ((first-num (car l)))
        (filter (λ (x) (even? (- x first-num)))  l)))
 
