#lang scheme

; SICP 1.41 - 1.43: Procedures as Returned Values
(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (double f)
  (lambda (x) (f (f x))))