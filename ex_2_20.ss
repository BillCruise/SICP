#lang scheme

; SICP 2.20: Dotted-tail notation
(define (same-parity a . z)
  (define (iter items answer)
    (if (null? items)
        answer
        (iter (cdr items)
              (if (= (remainder (car items) 2)
                     (remainder a 2))
                  (append answer (list (car items)))
                  answer))))
  (iter z (list a)))


    
