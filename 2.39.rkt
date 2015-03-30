#lang racket
(define nil '())
(define (reverse sequence)
  (foldr (lambda (x y) (append y (list x) )) nil sequence))
(define (rev sequence)
  (foldl (lambda (x y) (cons x y)) nil sequence))

 