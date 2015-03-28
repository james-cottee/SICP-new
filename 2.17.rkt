#lang racket
(define (last-pair l)
  (let ((len (- (length l) 1)))
    (list-ref l len)))