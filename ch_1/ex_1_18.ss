#lang scheme

; Exercise 1.18
(define (even? n)
  (= (remainder n 2) 0))

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (mult-iter a b product)
  (cond ((= 0 b) product)
        ((even? b) (mult-iter (double a) (halve b) product))
        (else (mult-iter a (- b 1) (+ a product)))))

(define (mult a b)
  (mult-iter a b 0))
