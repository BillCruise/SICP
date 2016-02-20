#lang scheme

(require (planet "sicp.ss" ("soegaard" "sicp.plt" 2 1)))

; SICP 2.50 - 2.51: Transforming and Combining Painters

; 2.50
(define (flip-horizontal painter)
  ((transform-painter (make-vect 1.0 0.0)   ; origin
                      (make-vect 0.0 0.0)   ; corner1
                      (make-vect 1.0 1.0))  ; corner2
   painter))

(define (rotate-180 painter)
  ((transform-painter (make-vect 1.0 1.0)
                      (make-vect 0.0 1.0)
                      (make-vect 1.0 0.0))
   painter))

(define (rotate-270 painter)
  ((transform-painter (make-vect 0.0 1.0)
                      (make-vect 0.0 0.0)
                      (make-vect 1.0 1.0))
   painter))

; 2.51a
(define (below-a painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-bottom
           ((transform-painter (make-vect 0.0 0.0)
                               (make-vect 1.0 0.0)
                               split-point)
            painter1))
          (paint-top
           ((transform-painter split-point
                               (make-vect 1.0 0.5)
                               (make-vect 0.0 1.0))
            painter2)))
      (lambda (frame)
        (paint-bottom frame)
        (paint-top frame)))))

; flip a painter vertically
(define (flip-vertical painter)
  ((transform-painter (make-vect 0.0 1.0)
                      (make-vect 1.0 1.0)
                      (make-vect 0.0 0.0))
  painter))

; 2.51b
(define (rotate-90 painter)
  ((transform-painter (make-vect 1.0 0.0)
                      (make-vect 1.0 1.0)
                      (make-vect 0.0 0.0))
   painter))

(define (below-b painter1 painter2)
  (rotate-90 (beside (rotate-270 painter1) (rotate-270 painter2))))

; rotate an image 45 degrees to the left
(define (rotate-45 painter)
  ((transform-painter (make-vect 0.5 0.0)
                      (make-vect 1.0 0.5)
                      (make-vect 0.0 0.5))
   painter))


