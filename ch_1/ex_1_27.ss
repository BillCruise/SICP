#lang scheme

; SICP Exercise 1.27: Carmichael numbers
(define (square x)
  (* x x))
  
(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n a)
  (= (expmod a n n) a))

(define (fermat-full n)
  (define (iter a)
    (cond ((= a 1) #t)
          ((not (fermat-test n a)) #f)
          (else (iter (- a 1)))))
  (iter (- n 1)))

