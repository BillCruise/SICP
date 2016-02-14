#lang scheme

; Exercise 1.44: Smoothing a function
(define (smooth f dx)
  (lambda (x)
    (/ (+ (f x)
          (f (+ x dx))
          (f (- x dx)))
       3)))

; impulse maker provided in the comments to exercise 1.44
(define (impulse-maker a y)
  (lambda (x)
    (if (= x a)
        y
        0)))

(define my-impulse-function
  (impulse-maker 0 6)) 
