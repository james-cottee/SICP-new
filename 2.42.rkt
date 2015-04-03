#lang racket
(define nil '())

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (cons new-row rest-of-queens))

(define (safe? k positions)
  (define (iter level up down pos)
    (cond ((null? pos) #t)
          ((= level (car pos)) #f)
          ((= up (car pos)) #f)
          ((= down (car pos)) #f)
          (else (iter level (+ up 1) (- down 1) (cdr pos)))))
  (iter (car positions) (+ 1 (car positions)) (- (car positions) 1) (cdr positions)))


(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(length (queens 8))

