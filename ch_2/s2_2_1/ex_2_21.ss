#lang scheme

; SICP 2.21 - 2.23: Mapping over lists

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list (cdr items)))))

(define (sq-list items)
  (map (lambda (x) (* x x)) items))