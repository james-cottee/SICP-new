#lang racket
 
(define (make-accumulator n)
  (λ (x) (begin (set! n (+ n x)) n)))

(define A (make-accumulator 5))