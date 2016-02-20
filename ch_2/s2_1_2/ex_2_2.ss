#lang scheme

; SICP 2.2: Line segments in a plane

; point constructor
(define (make-point x y) (cons x y))

; point selectors
(define (x-point p) (car p))
(define (y-point p) (cdr p))

; segment constructor
(define (make-segment a b) (cons a b))

; segment selectors
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))


(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment s)
  (make-point (/ (+ (x-point (start-segment s))
                    (x-point (end-segment s)))
                 2)
              (/ (+ (y-point (start-segment s))
                    (y-point (end-segment s)))
                 2)))