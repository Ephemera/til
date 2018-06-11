#lang racket

;; 7.2 혼합 데이터를 다루는 함수 디자인
;; 7.2.1  동물원의 동물들
;; 구조체:
(define-struct spider (remaining-legs moving-area))
(define-struct elephant (moving-area))
(define-struct monkey (intelligence moving-area))

;; 데이터 정의:
;; 동물은 다음의 세 구조체 중 하나이다
;; 1. (make-spider n a)
;; n은 number, a는 number
;; 2. (make-elephant a)
;; a는 number
;; 3. (make-monkey n a)
;; n은 number, a는 number

;; 템플릿:
;; (define (f an-animal)
;;   (cond
;;     [(spider? an-animal)
;;       ... (spider-remaining-legs an-animal) ... (spider-moving-area an-animal) ...]
;;     [(elephant? an-animal)
;;       ... (elephant-moving-area an-animal) ... ]
;;     [(monkey? an-animal)
;;       ... (monkey-intelligence an-animal) ... (monkey-moving-area an-animal) ... ]))

;; 정의:
(define (get-moving-area an-animal)
  (cond
    [(spider? an-animal) (spider-moving-area an-animal)]
    [(elephant? an-animal) (elephant-moving-area an-animal)]
    [(monkey? an-animal) (monkey-moving-area an-animal)]))

(define (fits? an-animal cage-size)
  (cond
    [(>= cage-size (get-moving-area an-animal)) 'Enough]
    [else 'NeedMore]))


;; 7.5.1
(define (checked-area-of-disk r)
  (cond
    [(number? r) 
     (cond
       [(> r 0) (area-of-disk r)]
       [else (error 'checked-area-of-disk "positive number expected")])]
    [else (error 'checked-area-of-disk "number expected")]))

;; 7.5.3
(define (checked-make-vec a-vec)
  (cond
    [(and (> (vec-x a-vec) 0) (> (vec-y a-vec) 0)) a-vec]
    [else (error 'checked-make-vec "invalidate structure")]))
