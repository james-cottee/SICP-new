#lang racket
(define (make-monitored f)
  (define number-of-calls 0)
  (define (nf x)
    (cond ((equal? x 'how-many-calls?) number-of-calls)
          ((equal? x 'reset-count ) (set! number-of-calls 0))
          (else (begin (set! number-of-calls (+ number-of-calls 1)) (f x )))))
  nf)

(define s (make-monitored sqrt))