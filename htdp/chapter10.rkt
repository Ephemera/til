#lang racket

;; 10.1.1
(define (hours->wages alon)
  (cond
    [(empty? alon) empty]
    [else (cons (wage (first alon)) (hours->wages (rest alon)))]))
(define (wage h)
  (* 14 h))

;; 10.1.2
(define (wage h)
  (cond
    [(> h 100) (error "too many hours")]
    [else (* 14 h)]))

;; 10.1.3
(define (convertFC alon)
  (cond
    [(empty? alon) empty]
    [else (cons (fahrenheit->celsius (first alon)) (convertFC (rest alon)))]))
(define (fahrenheit->celsius f)
  (* (- f 32) (/ 5 9)))

;; 10.1.5
(define (eliminate-exp ua lotp)
  (cond
    [(empty? lotp) empty]
    [else 
      (cond
        [(<= (first lotp) ua) (cons (first lotp) (eliminate-exp ua (rest lotp)))]
        [else (eliminate-exp ua (rest lotp))])]))
;; test
(eliminate-exp 1.0 (cons 2.95 (cons .95 (cons 1.0 (cons 5 empty)))))

;; 10.1.6
(define (name-robot alot)
  (cond
    [(empty? alot) empty]
    [else
      (cond
        [(equal? 'robot (first alot)) (cons 'r2d2 (name-robot (rest alot)))]
        [else (cons (first alot) (name-robot (rest alot)))])]))

(define (substitute to from alot)
  (cond
    [(empty? alot) empty]
    [else
      (cond
        [(equal? from (first alot)) (cons to (substitute to from (rest alot)))]
        [else (cons (first alot) (substitute to from (rest alot)))])]))
;; test
(substitute 'Barbie 'doll (cons 'robot (cons 'doll (cons 'dress empty))))

;; 10.1.7
(define (recall ty lon)
  (cond
    [(empty? lon) empty]
    [else
      (cond
        [(equal? (first lon) ty) (recall ty (rest lon))]
        [else (cons (first lon) (recall ty (rest lon)))])]))
;; test
(recall 'robot (cons 'robot (cons 'doll (cons 'dress empty))))

;; 10.1.9
(define (controller money)
  (cond
    [(>= (quotient money 100) 1)
     (cons (quotient money 100)
           (cons 'dollor (cons 'and
                               (controller (- money (* (quotient money 100) 100))))))]
    [else (cons money (cons 'cents empty))])) 
(controller 103)
