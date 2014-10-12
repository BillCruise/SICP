#lang scheme

; SICP 2.46 - 2.48: Frames & Painters

; constructor and selectors
(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

; vector algebra

(define (add-vect u v)
  (make-vect
    (+ (xcor-vect u) (xcor-vect v))
    (+ (ycor-vect u) (ycor-vect v))))

(define (sub-vect u v)
  (make-vect
    (- (xcor-vect u) (xcor-vect v))
    (- (ycor-vect u) (ycor-vect v))))

(define (scale-vect s v)
  (make-vect
    (* s (xcor-vect v))
    (* s (ycor-vect v))))

; 2.47a
;(define (make-frame origin edge1 edge2)
;  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

; 2.47a
;(define (edge2-frame frame)
;  (car (cdr (cdr frame))))


; 2.47b
(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (edge2-frame frame)
  (cdr (cdr frame)))

; 2.48
(define (make-segment v1 v2)
  (cons v1 v2))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

; 2.49
(define outline-segments
  (list
    (make-segment
      (make-vect 0.0 0.0)
      (make-vect 0.0 1.0))
    (make-segment
      (make-vect 0.0 0.0)
      (make-vect 1.0 0.0))
    (make-segment
      (make-vect 1.0 0.0)
      (make-vect 1.0 1.0))
    (make-segment
      (make-vect 0.0 1.0)
      (make-vect 1.0 1.0))))

(define outline-painter (segments->painter outline-segments))
