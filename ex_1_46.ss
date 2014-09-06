#lang scheme

; SICP 1.46: Iterative improvement

; sqrt procedure and sub-procedures from SICP 1.1.7
;(define (sqrt x)
;  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))


; fixed-point procedure from SICP 1.3.3
(define tolerance 0.00001)

;(define (fixed-point f first-guess)
;  (define (close-enough? v1 v2)
;    (< (abs (- v1 v2)) tolerance))
;  (define (try guess)
;    (let ((next (f guess)))
;      (if (close-enough? guess next)
;          next
;          (try next))))
;  (try first-guess))


; solution to SICP 1.46
(define (iterative-improve good-enough? improve)
  (define (iter-imp guess)
    (if (good-enough? guess)
        guess
        (iter-imp (improve guess))))
  iter-imp)

(define (sqrt x)
  ((iterative-improve (lambda (guess)
                        (< (abs (- (square guess) x))
                           0.001))
                      (lambda (guess)
                        (average guess (/ x guess))))
  1.0))

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
                        (< (abs (- (f guess) guess))
                           0.00001))
                      f)
   first-guess))