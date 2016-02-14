#lang scheme

; SICP Exercise 1.32: Accumulator
(define (identity x) x)

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (product-iter term a next b)
  (accum-iter * 1 term a next b))

(define (factorial x)
  (product-iter identity 1 inc x))

(define (wallis-pi n)
  (define (term x)
    (/ (* 4.0 (square x))
       (- (* 4.0 (square x)) 1)))
  (* 2.0 (product-iter term 1 inc n)))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
         (accumulate combiner null-value term (next a) next b))))

(define (accum-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))