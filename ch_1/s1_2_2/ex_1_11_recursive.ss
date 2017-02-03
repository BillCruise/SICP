#lang scheme

; Exercise 1.11 recursive solution
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

; Alternative problem from comments
; f(n) = n | n <= 5
;      = f(n - 1) + 3*f(n - 3) + 5*f(n - 5) | n > 5
(define (f2 n)
  (if (<= n 5)
      n
      (+ (f2 (- n 1))
         (* 3 (f2 (- n 3)))
         (* 5 (f2 (- n 5))))))