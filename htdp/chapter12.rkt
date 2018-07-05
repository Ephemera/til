#lang racket

;; sort : list-of-numbers->list-of-numbers
(define (sort alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert (first alon) (sort (rest alon)))]))

;; insert : number list-of-numbers->list-of-numbers
(define (insert n alon)
  (cond
    [(empty? alon) (cons n empty)]
    [else (cond
            [(>= n (first alon)) (cons n alon)]
            [(< n (first alon)) (cons (first alon) (insert n (rest alon)))])]))
;; 12.2.1
(define-struct mail (from date message))

(define (sort alon)
  (cond
    [(empty? alon) empty]
    [(cons? alon) (insert (first alon) (sort (rest alon)))]))

(define (insert-by-date n alon)
  (cond
    [(empty? alon) (cons n empty)]
    [else (cond
            [(>= (mail-date n) (mail-date(first alon))) (cons n alon)]
            [(< (mail-date n) (mail-date (first alon))) (cons (first alon) (insert-by-date n (rest alon)))])]))

;; 12.2.2
(define (search n alon)
  (cond
    [(empty? alon) false]
    [else (or (= (first alon) n) (search n (rest alon)))]))

(define (search-sorted n a-lon)
  (cond
    [(empty? a-lon) empty]
    [else (cond
            [(= (first a-lon) n) true]
            [(< (first a-lon) n) false]
            [(> (first a-lon) n) (search-sorted n (rest a-lon))])]))
