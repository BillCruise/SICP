#lang scheme

; SICP 1.42 & 1.43: Procedures as Returned Values
(define (inc x) (+ x 1))
(define (square x) (* x x))

(define (compose f g)
  (lambda (x) (f (g x))))


; Exercise 1.43
(define (repeated f x)
  (if (= x 1)
      f
      (compose f (repeated f (- x 1)))))

(define (n-fold-smooth f dx n)
  (repeated (smooth f dx) n))









       
    