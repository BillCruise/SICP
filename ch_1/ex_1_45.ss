#lang scheme

; Exercise 1.45: Computing nth roots
(define (average x y) (/ (+ x y) 2))

(define average-damp
  (lambda (f)
      (lambda (x) (average (f x) x))))

(define (fixed-point f start)
  (define tolerance 0.00001)
  (define (close-enuf? u v)
     (< (abs (- u v)) tolerance))
  (define (iter old new)
     (if (close-enuf? old new)
         new
         (iter new (f new))))
  (iter start (f start)))

(define (sqrt x)
  (fixed-point
      (average-damp (lambda (y) (/ x y)))
      1))

(define (nth-root x n)
  (fixed-point
   ((repeated average-damp (floor (log2 n)))
    (lambda (y) (/ x (expt y (- n 1)))))
   1.0))

(define (log2 x)
  (/ (log x) (log 2)))