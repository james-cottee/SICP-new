#lang racket
(define (square-tree tree)
        (cond ((null? tree) '())
              ((pair? tree) (cons (square-tree (car tree)) (square-tree (cdr tree))))
              (else (* tree tree))))

(display (square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7))))