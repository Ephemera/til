#lang racket

;; 2.1.1 racket이 제공하는 수의 연산
(sqr 5) ; = 25, 제곱
(sin 45) ; = 0.8509035245341184, 사인값
(max 1 2) ; = 2, 큰 수, 두 개 이상도 가능하다 e.g. (max 1 2 3 4)

;; 2.1.2 계산
(sqrt 4) ; = 2
(sqrt 2) ; = 1.4142135623730951
(sqrt -1) ; = 0+1i
(tan 45) ; = 1.6197751905438615


;; 2.2.1 화씨로 입력받다 섭씨로 출력하는 프로그램을 정의하라
; fahrenheit->celsius :: Rational Rational 
(define (fahrenheit->celsius f)
  (* (- f 32) (/ 5 9)))

(= (fahrenheit->celsius 41) 5)

;; 2.2.2 달러로부터 유로화 변환 프로그램을 정의하라
; dollar->euro :: Rational Rational
(define (dollar->euro d)
  (* d 0.85))

;; 2.2.3 define the program triangle
; triangle :: Rational Rational
(define (triangle side height)
  (* (/ 1 2) (* side height)))

;; 2.2.4 define the program convert3
; convert3 :: Int Int Int String
(define (convert3 x y z)
  (string-join (map number->string (sort (list x y z) >)) ""))

(string=? (convert3 1 2 3) "321")

;; 2.2.5 expressions
; f1 :: Int Int  
(define (f1 n)
  (+ (* n n) 10))

(= (f1 2) 14)
(= (f1 9) 91)

; f2 :: Int Int
(define (f2 n)
  (+ (* (/ 1 2) (* n n)) 20))

(= (f2 2) 22)
(= (f2 9) (/ 121 2))

; f3 :: Int Int
(define (f3 n)
  (- 2 (/ 1 n)))

(= (f3 2) (/ 3 2))
(= (f3 9) (/ 17 9))


;; 2.3.1
; tax :: Rational Rational
(define (tax income)
  (* income 0.15))

; netplay :: Int Int 
(define (netplay hour)
  (* hour 12))

;; 2.3.2
; sum-coins :: Int Int Int Int Int
(define (sum-coins penny nickel dime quarter)
  (+ penny 
     (+ (* nickel 5)
        (+ (* dime 10)
           (+ (* quarter 25))))))

(= (sum-coins 1 2 3 4) 141)

;; 2.3.3
; total-profit :: Int Int
(define (total-profit attendance)
  (- (* attendance 5) (+ 20 (* attendance 0.5))))

(= (total-profit 10) 25)


;; 2.4.1
(+ (10) 20) ; 괄호로 둘러쌓인 10을 함수로 인식  
(10 + 20) ; 10을 함수로 인식하고 잘못된 인자가 들어간 것으로 판단
(+ +) ; + 함수의 인자로 숫자가 들어와야하지만 +가 들어감

;; 2.4.2
(define (f 1) ; 1은 식별자나 인자로 인지되지 않음. 1을 x로 변경해주면 해결.
  (+ x 10))

(define (g x) ; 오류가 발생하진 않으나 기대했던대로 실행되지 않고 
  + x 10)     ; stdin을 받아서 그대로 출력한다. 괄호를 제대로 씌워준다.

(define h(x)  ; 구문오류. (h x)로 수정한다 .
  (+ x 10))

;; 2.4.3
(+ 5 (/ 1 0)) ; 0으로 나누는건 불능
(sin 10 20)   ; 인자수 불일치
(somef 10)    ; 선언되지않은 함수

;; 2.4.4
(define (somef x)
  (sin x x))

(somef 10 20) ; somef의 인자수 불일치
(somef 10)    ; sin의 인자수 불일치

