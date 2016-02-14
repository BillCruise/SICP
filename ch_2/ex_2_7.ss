#lang scheme

; SICP 2.7 - 2.14: Interval Arithmetic

; provided procedures
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))


; Exercise 2.7
; by convention the bounds are added in lower-upper order
(define (make-interval a b) (cons a b))

(define (upper-bound intrvl)
  (cdr intrvl))

(define (lower-bound intrvl)
  (car intrvl))

; Exercise 2.8
; interval subtraction: [a,b] − [c,d] = [a − d, b − c]
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

; Exercise 2.10
(define (spans-zero? y)
  (and (<= (lower-bound y) 0)
       (>= (upper-bound y) 0)))

(define (div-interval x y)
  (if (spans-zero? y)
      (error "Error: The denominator should not span 0.")
      (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))))


; Exercise 2.11
(define (mul-interval x y)
  (let ((xlo (lower-bound x))
        (xhi (upper-bound x))
        (ylo (lower-bound y))
        (yhi (upper-bound y)))
  (cond ((and (>= xlo 0)
              (>= xhi 0)
              (>= ylo 0)
              (>= yhi 0))
         ; [+, +] * [+, +]
         (make-interval (* xlo ylo) (* xhi yhi)))
        ((and (>= xlo 0)
              (>= xhi 0)
              (<= ylo 0)
              (>= yhi 0))
         ; [+, +] * [-, +]
         (make-interval (* xhi ylo) (* xhi yhi)))
        ((and (>= xlo 0)
              (>= xhi 0)
              (<= ylo 0)
              (<= yhi 0))
         ; [+, +] * [-, -]
         (make-interval (* xhi ylo) (* xlo yhi)))
        ((and (<= xlo 0)
              (>= xhi 0)
              (>= ylo 0)
              (>= yhi 0))
         ; [-, +] * [+, +]
         (make-interval (* xlo yhi) (* xhi yhi)))
        ((and (<= xlo 0)
              (>= xhi 0)
              (<= ylo 0)
              (>= yhi 0))
         ; [-, +] * [-, +]
         (make-interval (min (* xhi ylo) (* xlo yhi))
                        (max (* xlo ylo) (* xhi yhi))))
        ((and (<= xlo 0)
              (>= xhi 0)
              (<= ylo 0)
              (<= yhi 0))
         ; [-, +] * [-, -]
         (make-interval (* xhi ylo) (* xlo ylo)))
        ((and (<= xlo 0)
              (<= xhi 0)
              (>= ylo 0)
              (>= yhi 0))
         ; [-, -] * [+, +]
         (make-interval (* xlo yhi) (* xhi ylo)))
        ((and (<= xlo 0)
              (<= xhi 0)
              (<= ylo 0)
              (>= yhi 0))
         ; [-, -] * [-, +]
         (make-interval (* xlo yhi) (* xlo ylo)))
        ((and (<= xlo 0)
              (<= xhi 0)
              (<= ylo 0)
              (<= yhi 0))
         ; [-, -] * [-, -]
         (make-interval (* xhi yhi) (* xlo ylo))))))


; Represent intervals as a center value and a width
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

; Exercise 2.12
(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

(define (percent i)
  (* 100.0 (/ (width i) (center i))))


; Exercise 2.14
(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1))) 
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))