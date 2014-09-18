#lang scheme

; SICP 2.21 - 2.23: Mapping over lists

(define (for-each1 proc items)
  (cond ((null? items) null)
        (else (proc (car items))
              (for-each proc (cdr items)))))


(define (map proc items)
   (if (null? items)
       null
       (cons (proc (car items))
             (map proc (cdr items)))))

(define (for-each f items)
  (if (null? items)
      (newline)
      (let ()
        (f (car items))
        (for-each f (cdr items)))))