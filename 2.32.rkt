#lang racket
 (define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (λ (x) (cons (car s) x )) rest)))))