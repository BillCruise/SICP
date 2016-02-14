#lang scheme

(define epsilon 1e-7)

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(define (term n radians)
  (* (/ (expt radians (+ (* 2 n) 1))
        (factorial (+ (* 2 n) 1)))
     (expt -1 n)))

(define (reduce x)
   (- x (* (round (/ x (* 2 pi))) 2 pi)))

(define (good-enough? current next)
  (< (abs (- current next)) epsilon))

(define (sine-iter radians n current next)
  (if (good-enough? current next)
      next
      (sine-iter radians (+ n 1) next (+ next
                                         (term (+ n 1) radians)))))

(define (taylor-sine radians)
  (sine-iter (reduce radians) 0 0 (term 0 (reduce radians))))


(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sicp-sine angle)
   (if (not (> (abs angle) epsilon))
       angle
       (p (sicp-sine (/ angle 3.0)))))