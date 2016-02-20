#lang scheme

; SICP 2.27: Reversing Nested Lists
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define (reverse items)
  (if (null? items)
      items
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (cond ((null? items) null)
        ((pair? (car items))
         (append (deep-reverse (cdr items))
                 (list (deep-reverse (car items)))))
        (else
         (append (deep-reverse (cdr items))
                 (list (car items))))))


(define (d-reverse items)
  (define (iter items result)
    (cond ((null? items) result)
          ((pair? (car items))
           (iter (cdr items)
                 (cons (d-reverse (car items)) result)))
          (else
           (iter (cdr items)
                 (cons (car items) result)))))
  (iter items null))

(define (deep-iter items)
  (define (iter items result)
    (cond ((null? items) result)
          ((pair? items)
           (iter (cdr items) (cons (deep-iter (car items)) result)))
          (else items)))
  (iter items null))




