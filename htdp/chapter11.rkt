#lang racket

(define (hellos n)
  (cond
    [(zero? n) empty]
    [else (cons 'hello (hellos (sub1 n)))]))

;; 11.2.1
(define (repeat n sym)
  (cond
    [(zero? n) empty]
    [else (cons sym (hellos (sub1 n)))]))

;; 11.2.2
(define (f x)
  (+ (* 3 (* x x))
     (+ (* -6 x)
        -1)))

(define (tabulate-f n)
  (cond
    [(zero? n) empty]
    [else (cons (f n) (tabulate-f (sub1 n)))]))


;; 11.3.1
(define (random-n-m n m)
  (+ (random (- m n)) n))
(random-n-m 5 10) ; test

;; 11.3.2
(define (tie-dyed n)
  (cond
    [(= n 0) empty]
    [else (cons (random-n-m 20 120) (tie-dyed (- n 1)))]))
(tie-dyed 10) ; test

