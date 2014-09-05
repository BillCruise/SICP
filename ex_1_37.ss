#lang scheme

; SICP 1.37, 1.38, and 1.39: Continued Fractions
(define (cont-frac n d k)
  (define (frac i)
    (if (< i k)
        (/ (n i) (+ (d i) (frac (+ i 1))))
        (/ (n i) (d i))))
  (frac 1))

(define (cont-frac-iter n d k)
  (define (frac-iter i result)
    (if (= i 0)
        result
        (frac-iter (- i 1) (/ (n i) (+ (d i) result)))))
    (frac-iter (- k 1) (/ (n k) (d k))))

; Exercise 1.38
(define (d i)
  (if (not (= 0 (remainder (+ i 1) 3)))
      1
      (* 2 (/ (+ i 1) 3))))

(define e
  (+ 2 (cont-frac (lambda (i) 1.0) d 10)))

; Exercise 1.39
(define (square x) (* x x))

(define (tan-cf x k)
  (define (n k)
    (if (= k 1)
        x
        (- (square x))))
  (define (d k)
    (- (* 2 k) 1))
  (cont-frac n d k))
      


