#lang scheme

; Exercise 1.11 iterative solution
(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))

(define (f-iter a b c count)
  (if (< count 3)
      a
      (f-iter (+ a (* 2 b) (* 3 c))
              a
              b
              (- count 1))))

  
; Alternative problem from comments
; f(n) = n | n <= 5
;      = f(n - 1) + 3*f(n - 3) + 5*f(n - 5) | n > 5
(define (f2 n)
  (if (<= n 5)
      n
      (f2-iter 5 4 3 2 1 n)))

(define (f2-iter a b c d e count)
  (if (<= count 5)
      a
      (f2-iter (+ a (* 3 c) (* 5 e))
              a
              b
              c
              d
              (- count 1))))
