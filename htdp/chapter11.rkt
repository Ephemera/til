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


;; 11.4.1
(define (! n)
  (cond
    [(zero? n) 1]
    [else (* n (! (sub1 n)))]))
(! 10)
(! 100)

(define (product-from-20 n)
  (cond
    [(<= n 20) 1]
    [else (* n (product-from-20 (sub1 n)))]))
(product-from-20 21)
(product-from-20 22)

;; 11.4.2
(define (product n m)
  (cond
    [(<= m n) 1]
    [else (* m (product n (sub1 m)))]))

(product 20 22)

;; 11.4.3
(define (product-from-minus-11 n)
  (product -11 n))
(product-from-minus-11 0)

;; 11.5.1
(define (add n x)
  (cond
    [(zero? n) x]
    [else (add1 (add (sub1 n) x))]))
(= (add 11 12) 23)

;; 11.5.2
(define (multiply-by-pi n)
  (cond 
    [(zero? n) 0]
    [else (+ 3.14 (multiply-by-pi (sub1 n)) )]))
(= (multiply-by-pi 0) 0)
(= (multiply-by-pi 2) 6.28)

(define (multiply n x)
  (cond
    [(zero? n) 0]
    [else (add x (multiply (sub1 n) x))]))
(= (multiply 2 3) 6)

;; 11.5.3
(define (exponent n x)
  (cond
    [(zero? n) 1]
    [else (multiply x (exponent (sub1 n) x))]))
(= (exponent 2 3) 9)

