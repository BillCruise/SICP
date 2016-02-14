#lang scheme

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

(define outline-segments
  (list
    (make-segment
      (make-vect 0.0 0.0)
      (make-vect 0.0 0.99))
    (make-segment
      (make-vect 0.0 0.0)
      (make-vect 0.99 0.0))
    (make-segment
      (make-vect 0.99 0.0)
      (make-vect 0.99 0.99))
    (make-segment
      (make-vect 0.0 0.99)
      (make-vect 0.99 0.99))))

(define outline-painter (segments->painter outline-segments))

(define x-segments
  (list
    (make-segment
      (make-vect 1.0 0.0)
      (make-vect 0.0 1.0))
    (make-segment
      (make-vect 0.0 0.0)
      (make-vect 1.0 1.0))))

(define x-painter (segments->painter x-segments))