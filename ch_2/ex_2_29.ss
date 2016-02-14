#lang scheme

; SICP 2.29: Binary Mobiles

; The following constructors are provided, giving us a representation 
; of binary mobiles held together with the list procedure:
(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

; Write the corresponding selectors left-branch and right-branch, 
; which return the branches of a mobile, and branch-length and
; branch-structure, which return the components of a branch.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

; Define a procedure total-weight that returns the weight of an entire mobile.
; The total weight of a mobile is just the sum of the left branch and the 
; right branch. The weight of a branch is defined recursively if the branch
; is itself a mobile, or just returned if the branch holds a single weight.
(define (branch-weight branch)
  (if (pair? (branch-structure branch))
      (total-weight (branch-structure branch))
      (branch-structure branch)))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))


; Procedure for calculating the torque of a branch
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

; Determine if a mobile and its branches are balanced.
(define (branch-balanced? branch)
  (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      true))

(define (balanced? mobile)
  (and (= (branch-torque (left-branch mobile))
          (branch-torque (right-branch mobile)))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))
