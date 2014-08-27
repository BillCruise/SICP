#lang scheme

; Exercise 1.16
(define (even? n)
  (= (remainder n 2) 0))

(define (square x)
  (* x x))

(define (expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (expt-iter (square b) (/ n 2) a))
        (else (expt-iter  b (- n 1) (* a b)))))

(define (fast-expt b n)
  (expt-iter b n 1))
