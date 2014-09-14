#lang scheme

; SICP 2.17: Last Item in a List
(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))
