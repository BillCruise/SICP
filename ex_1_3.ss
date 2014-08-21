#lang scheme

; Exercise 1.3
(define (square x)
   (* x x))

(define (max x y)
   (if (> x y) x y))

(define (min x y)
   (if (< x y) x y))

(define (sum-of-highest-squares x y z)
     (+ (square (max x y))
       (square (max (min x y) z))))
