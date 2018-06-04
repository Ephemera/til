#lang racket

;; 4.1 불린과 관계
;; 4.1.1
(and (> 4 3) (<= 10 100)) ; true
(or (> 4 3) (= 10 100)) ; true
(not (= 2 3)) ; true
;; 4.1.2
(define (p1 x)
  (> x 3))
(p1 4) ; true
(p1 2) ; false
(p1 (/ 7 2)) ; true

(define (p2 x)
  (and (> 4 x) (> x 3)))
(p2 4) ; false
(p2 2) ; false
(p2 (/ 7 2)) ; true

(define (p3 x)
  (= (* x x) x))
(p3 4) ; false
(p3 2) ; false
(p3 (/ 7 2)) ; false


;; 4.2 조건을 검사하는 함수
;; 4.2.1
(define (between1 n)
  (and (< 3 n) (<= n 7)))
(define (between2 n)
  (and (<= 3 n) (<= n 7)))
(define (between3 n)
  (and (<= 3 n) (< n 9)))
(define (between4 n)
  (or (and (< 1 n) (< n 3))
      (and (< 9 n) (< n 11))))
(define (between5 n)
  (or (<= n 1) (<= 3 n)))

;; 4.2.3
;; equation1 : number->number
(define (equation1 n)
  (= (+ (* 4 n) 2) 62))
(equation1 10) ; false
(equation1 12) ; false
(equation1 14) ; false
;; equation2 : number->number
(define (equation2 n)
  (= (* 2 (sqr n)) 102)) 
(equation2 10) ; false
(equation2 12) ; false
(equation2 14) ; false
;; equation3 : number->number
(define (equation3 n)
  (= (+ (+ (* 4 (sqr n)) (* 6 n)) 2) 462))
(equation3 10) ; true 
(equation3 12) ; false
(equation3 14) ; false


;; 4.3 조건과 조건문
;; 4.3.2
;; judge : number->number
(define (judge n)
  (cond
    [(<= n 1000) .040]
    [(<= n 5000) .045]
    [(<= n 10000) .055]
    [(> n 10000) .060]))
(judge 500) ; 0.04
(judge 2800) ; 0.045
(judge 15000) ; 0.06

;; 4.3.3
;; judge : number->number
(define (judge n)
  (cond
    [(<= n 1000) (* .040 1000)]
    [(<= n 5000) (+ (* 1000 .040)
                    (* (- n 1000) .045))]
    [else (+ (* 1000 .040)
             (* 4000 .045)
             (* (- n 10000) .055))]))
(judge 500) ; 40.0
(judge 2800) ; 121.0
(judge 15000) ; 495.0

;; 4.4 조건 함수 디자인하기
;; 4.4.1
;; interest : number->number
(define (interest amount)
  (cond
    [(<= amount 1000) (* amount .04)]
    [(<= amount 5000) (* amount .045)]
    [(> amount 5000) (* amount .05)]))

;; 4.4.2
;; tax : number->number
(define (tax income)
  (cond
    [(<= income 240) 0]
    [(and (> income 240) (<= income 480)) (* income .15)]
    [(> income 480) (* income .28)]))
;; netpay : number->number
(define (netpay hour)
  (- (* 12 hour) (tax (* 12 hour))))

;; 4.4.3
;; pay-back : number->number
(define (pay-back n)
  (cond
    [(<= n 500) (* n .0025)]
    [(and (> n 500) (<= n 1500)) (+ 1.25 (* (- n 500) .005))]
    [(and (> n 1500) (<= n 2500)) (+ 1.25 5 (* (- n 1500) .0075))]
    [else (+ 1.25 5 7.5 (* (- n 2500) .01))]))
(= (pay-back 400) 1)
(= (pay-back 1400) 5.75)
(pay-back 2000) ; 10.0
(pay-back 2600) ; 14.75

;; 4.4.4
;; judge : number->number
(define (judge a b c)
  (- (sqr b) (* 4 a c)))
;; how-many : number->number
(define (how-many a b c)
  (cond
    [(> (judge a b c) 0) 2]
    [(= (judge a b c) 0) 1]
    [(< (judge a b c) 0) 0]))
(= (how-many 1 0 -1) 2)
(= (how-many 2 4 2) 1)


