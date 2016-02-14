#lang scheme

; SICP 2.19: Counting Change Revisited
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

; reversed list of us coins
(define su-coins (list 1 5 10 25 50))
; reverse list of uk coins
(define ku-coins (list 0.5 1 2 5 10 20 50 100))

(define some-coins (list 10 5 1 50 25))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc amount
                (except-first-denomination coin-values))
            (cc (- amount
                   (first-denomination coin-values))
                coin-values)))))

; return true if passed an empty list
(define (no-more? coin-values)
  (if (null? coin-values) true false))

; return all coin values except the first
(define (except-first-denomination coin-values)
  (cdr coin-values))

; return only the first coin value
(define (first-denomination coin-values)
  (car coin-values))
