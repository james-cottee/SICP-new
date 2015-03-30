#lang racket
;;SICP defines accumulate but using racket foldr as shortcut
(define accumulate foldr)

(define nil '())

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))


(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (λ (x) (dot-product x v)) m))


(define (transpose mat)
  (accumulate-n cons nil mat))
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (λ (x) (matrix-*-vector cols x)) m)))




 