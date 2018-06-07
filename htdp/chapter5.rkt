#lang racket

;; 5.1 기호에 관한 몸풀기 문제
;; 5.1.2
;; check-guess : number number->string 
(define (check-guess guess target)
  (cond
    [(> guess target) "TooLarge"]
    [(= guess target) "Perfect"]
    [(< guess target) "TooSmall"]))

;; 5.1.3
;; digits : number number number -> number
(define (digits x y z)
  (+ x (* y 10) (* z 100)))
;; check-guess3 : number number number number->string
(define (check-guess3 x y z target)
  (check-guess (digits x y z) target)) 

;; 5.1.4
;; judge : number number number->number
(define (judge a b c)
  (- (sqr b) (* 4 a c)))
;; what-kind : number number number->symbol
(define (what-kind a b c)
  (cond
    [(= a 0) 'degenerate]
    [(> (judge a b c) 0) 'two]
    [(= (judge a b c) 0) 'one]
    [(< (judge a b c) 0) 'none]))

;; 5.1.5
;; check-color : symbol symbol symbol symbol->symbol
(define (check-color t1 t2 a1 a2)
  (cond
    [(and (equal? t1 a1) (equal? t2 a2)) 'Perfect]
    [(or (equal? t1 a1) (equal? t2 a2)) 'OneColorAtCorrectPosition]
    [(or (equal? t1 a2) (equal? t2 a1)) 'OneColorOccurs]
    [else 'NothingCorrect]))
