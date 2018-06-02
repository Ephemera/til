#lang racket

;; 3.1 함수 조합
;; 3.1.1
;; 표당 가격이 5달러일때 관객이 회당 120명 들어온다
;; 값을 0.1달러씩 낮출때마다 15명씩 증가  
;; attendes : number->number
(define (attendees ticket-price)
  (+ 120 (* (/ (- 5 ticket-price) 0.1) 15)))

(= (attendees 3) 420)
(= (attendees 4) 270)
(= (attendees 5) 120)

;; 3.1.2
;; 영화를 한 번 상영하는데 180달러
;; 관객 한 명당 0.04달러 추가비용
;; revenue : number->number 
(define (revenue ticket-price)
  (* (attendees ticket-price) ticket-price))

(= (revenue 3) 1260)
(= (revenue 4) 1080)
(= (revenue 5) 600)

;; cost : number->number
(define (cost ticket-price)
  (+ 180 (* (attendees ticket-price) 0.04)))

(= (cost 3) 196.8)
(= (cost 4) 190.8)
(= (cost 5) 184.8)

;; profit : number->number
(define (profit ticket-price)
  (- (revenue ticket-price) (cost ticket-price)))

(= (profit 3) 1063.2) 
(= (profit 4) 889.2)
(= (profit 5) 415.2)

; 세가지 가격중 3달러가 최대 이익

;; 3.1.4
;; cost2 : number->number
(define (cost2 ticket-price)
  (* (attendees ticket-price) 1.5))

;; profit2 : number->number
(define (profit2 ticket-price)
  (- (revenue ticket-price) (cost2 ticket-price)))

(= (profit2 3) 630)
(= (profit2 4) 675)
(= (profit2 5) 420)


;; 3.2 변수 정의
;; 3.2.1
(define basis-attendees 120)
(define basis-ticket-price 5)
(define increment (/ 15 .10))

(define (attendees ticket-price)
  (+ basis-attendees (* increment (- 5 ticket-price))))

(define default-cost 180)
(define additional-cost .04)

(define (cost ticket-price)
  (+ default-cost (* (attendees ticket-price) additional-cost)))


;; 3.3 함수 구성에 관한 연습문제
;; 3.3.1 미터법
(define inche2cm 2.54)
(define foot2inche 12)
(define yard2foot 3)
(define rod2yards 5.5)
(define furlong2rod 40)
(define mile2furlong 8)
;; inches->cm : number->number
(define (inches->cm n)
  (* n inche2cm))
;; feet->inches : number->number
(define (feet-inches n)
  (* n foot2inche))
;; yards->feet : number->number
(define (yards-feet n)
  (* n yard2foot))
;; rods->yards : number->number
(define (rods->yards n)
  (* n rod2yard))
;;furlongs->rods : number->number
(define (furlongs->rods n)
  (* n furlong2rod))
;; miles->furlongs : number->number
(define (miles->furlongs n)
  (* n mile2furlong))

;; feet->cm : number->number
(define (feet->cm n)
  (* (* n foot2inche) inche2cm))
;; yards->cm : number->number
(define (yards->cm n)
  (* (* n yard2foot) feet->cm))
;; rods->inches : number->number
(define (rods->inches n)
  (* (* n rod2yard) yards->cm))
;; miles->feet : number->number
(define (miles->feet n)
  (/ (* (* (* n mile2furlong) furlong2rod) rods->inches) foot2inche))

;; 3.3.2 원기둥부피
;; circle-area : number->number
(define (circle-area r)
  (* 3.14 (sqr r)))
;; volume-cylinder : number->number
(define (volume-cylinder r h)
  (* (circle-area r) h))

;; 3.3.3 원기둥면적 
;; circle-round : number->number
(define (circle-round r)
  (* 2 (* 3.14 r)))
;; area-cylinder : number->number
(define (area-cylinder r h)
  (+ (* (circle-round r) h) (* 2 (circle-area r))))

