#lang scheme

; SICP 2.3: Rectangles in a plane

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

; rectangle constructor
; join two opposite corners
(define (make-rect a b) (cons a b))

; rectangle selectors
(define (rect-width r)
    (abs (- (x-point (car r)) (x-point (cdr r)))))

(define (rect-height r)
    (abs (- (y-point (car r)) (y-point (cdr r)))))

(define (rect-perimeter r)
  (* 2 (+ (rect-width r) (rect-height r))))

(define (rect-area r)
  (* (rect-width r) (rect-height r)))