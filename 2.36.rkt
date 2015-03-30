#lang racket
;;accumulate previously defined in SICP but defining as racket procedure foldr
(define accumulate foldr)
(define nil '())
(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


 
 
 
