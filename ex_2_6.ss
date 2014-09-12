#lang scheme

; SICP 2.6: Church numerals
(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define (add-church m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))


(define (inc n)
  (+ n 1))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))