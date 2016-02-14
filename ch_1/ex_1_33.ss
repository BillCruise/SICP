#lang scheme

(require (lib "27.ss" "srfi"))

; SICP Exercise 1.33: Filtered Accumulator
(define (filtered-accum filter combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accum filter combiner null-value term (next a) next b))
          (filtered-accum filter combiner null-value term (next a) next b))))

; a
(define (fast-prime? n)
  (define (smallest-divisor n)
     (define (find-divisor n test-divisor)
        (define (next x)
           (if (= x 2) 3 (+ x 2)))
        (define (divides? a b)
           (= (remainder b a) 0))
        (cond ((> (square test-divisor) n) n)
              ((divides? test-divisor n) test-divisor)
              (else (find-divisor n (next test-divisor)))))
     (find-divisor n 2))
   (= n (smallest-divisor n)))


(define (sum-squared-primes a b)
  (filtered-accum fast-prime? + 0 square a inc b))

(define (inc x) (+ x 1))

(define (square x)
   (* x x))

; b

(define (gcd a b)
   (if (= b 0)
       a
       (gcd b (remainder a b))))

(define (product-of-coprimes n)
  (define (coprime? i)
    (= 1 (gcd i n)))
  (filtered-accum coprime? * 1 identity 1 inc (- n 1)))

(define (identity x) x)
