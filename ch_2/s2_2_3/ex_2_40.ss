#lang scheme

; SICP 2.40 & 2.41: Nested Mappings

; filter and accumulate from SICP 2.2.3
(define (filter predicate sequence)
  (cond ((null? sequence) null)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; enumerate-interval from SICP 2.2.3
(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

; flatmap from SICP 2.2.3
(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))

(define (xprime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (flatmap
                (lambda (i)
                  (map (lambda (j) (list i j))
                       (enumerate-interval 1 (- i 1))))
                (enumerate-interval 1 n)))))

; from SICP 1.2.6: Testing for Primality
(define (smallest-divisor n)
   (find-divisor n 2))

(define (find-divisor n test-divisor)
   (cond ((> (square test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
   (= (remainder b a) 0))

(define (square x)
   (* x x))

(define (prime? n)
  (= n (smallest-divisor n)))

; solution to 2.40
(define (unique-pairs n)
  (flatmap
   (lambda (i)
     (map (lambda (j) (list i j))
          (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))