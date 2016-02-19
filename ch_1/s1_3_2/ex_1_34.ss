#lang scheme

; SICP Exercise 1.34: Procedures as Arguments
(define (f g)
  (g 2))

(define (square x) (* x x))
