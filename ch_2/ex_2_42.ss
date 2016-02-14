#lang scheme

; SICP 2.42 & 2.43: The N Queens Problem

; define an empty board
(define empty-board null)

; the position of a piece is defined by its row and column
(define (make-position row col)
  (cons row col))

(define (position-row position)
  (car position))

(define (position-col position)
  (cdr position))

; adjoining a new position
(define (adjoin-position row col positions)
  (append positions (list (make-position row col))))


; a queen is safe if no other queens are in the same
; row, column, or diagonal.  We're only placing one
; queen per column, so we don't need to check columns.
(define (safe? col positions)
  (let ((kth-queen (list-ref positions (- col 1)))
        (other-queens (filter (lambda (q)
                                (not (= col (position-col q))))
                              positions)))
  (define (attacks? q1 q2)
    (or (= (position-row q1) (position-row q2))
        (= (abs (- (position-row q1) (position-row q2)))
           (abs (- (position-col q1) (position-col q2))))))
  (define (iter q board)
    (or (null? board)
        (and (not (attacks? q (car board)))
             (iter q (cdr board)))))
  (iter kth-queen other-queens)))


; provided in SICP 2.2.3
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))
                       

; given in exercise 2.42
(define (queens board-size)
  (define (queen-cols k)  
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

