#lang scheme

; SICP Exercise 1.31: Product of a Series
(define (identity x) x)

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))


(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial x)
  (product-iter identity 1 inc x))

(define (wallis-pi n)
  (define (term x)
    (/ (* 4.0 (square x))
       (- (* 4.0 (square x)) 1)))
  (* 2.0 (product-iter term 1 inc n)))
