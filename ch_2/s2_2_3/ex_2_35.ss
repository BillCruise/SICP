#lang scheme

; SICP 2.35: Counting the Leaves of a Tree

; count-leaves from sicp section 2.2.2
(define (cnt-leaves x)
  (cond ((null? x) 0)  
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

; accumulate from sicp section 2.2.3
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; enumerate-tree from sicp 2.2.3
(define (enumerate-tree tree)
  (cond ((null? tree) null)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))


(define (count-leaves t)
  (accumulate + 0 (map (lambda (x) 1)
                       (enumerate-tree t))))

