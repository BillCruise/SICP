#lang scheme

; SICP 2.40 & 2.41: Nested Mappings

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (ordered-triples n)
  (flatmap (lambda (i)
     (flatmap (lambda (j)
        (map (lambda (k)
               (list i j k))
             (enumerate-interval 1 (- j 1))))
      (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (triple-sum? triple s)
  (= s (accumulate + 0 triple)))

(define (make-triple-sum triple)
  (append triple (list (accumulate + 0 triple))))

(define (ordered-triple-sum n s)
  (define (triple-sum? triple)
    (= s (accumulate + 0 triple)))
  (map make-triple-sum
       (filter triple-sum?
               (ordered-triples n))))