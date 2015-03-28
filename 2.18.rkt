#lang racket
(define (rev l)
	(if (null? l)
	    '() 
	    	(append (rev (cdr l)) (list (car l)))))
