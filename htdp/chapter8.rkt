#lang racket

;; Scheme의 어휘: 변수, 상수(불린, 기호, 수), 연산
;; (변수) <var> = x | area-of-disk | perimeter | ...
;; (상수) <con> = true | false
;;                'a | 'doll | 'sum | ...
;;                1 | -1 | 3/5 | 1.22 | ...
;; (연산) <prm> = + | - | ...
;; Scheme의 문법
;; (정의) <def> =   (define (<var> <var> ... <var>) <exp>)
;;                | (define <var> <exp>)
;;                | (define-struct <var0> (<var1> ... <var-n>))
;; (표현) <exp> =   <var>
;;                | <con>
;;                | (<prm> <exp> ... <exp>)
;;                | (<var> <exp> ... <exp>)
;;                | (cond (<exp> <exp>) ... (<exp> <exp>))
;;                | (cond (<exp> <exp>) ... (else <exp>))
;;                | (and <exp> <exp>)
;;                | (or <exp> <exp>)

;; 8.2.1
;; 1. x - 변수 하나로 표기할 수 있다
;; 2. (= y z) - (<prm> <var> <var>) 형태로 문법적으로 맞다
;; 3. (= (= y z) 0) - 표현식도 연산 안에 쓸 수 있다
;;
;; 1. (3 + 4) - 연산의 표현방식이 잘못되었다
;; 2. empty? (l) - 괄호의 위치가 잘못되었다
;; 3. (x) - 변수 하나를 표현식 안에 사용할 수 없다

;; 8.2.2
;; 1. (define (f 'x) x) - 함수의 정의에 따라 기호가 들어갈 수 없다
;; 2. (define (f x y z) (x)) - 변수 하나를 표현식 안에 사용할 수 없다
;; 3. (define (f) 10) - 함수의 정의에 따라 두개 이상의 변수가 들어가야한다


;; 8.7.1
;; 1. (define-struct personne-record (name salary dob ssn)) - right
;; 2. (define-struct oops ()) - 변수가 존재하지 않는다
;; 3. (define-struct child (dob date (- date dob))) - 마지막 값에 변수가 들어가야한다
;; 4. (define-struct (child person) (dob date)) - 문법이 틀렸다
;; 5. (define-struct child (parents dob date)) - right

;; 8.7.2
;; 1. (make-point 1 2 3) - 값
;; 2. (make-point (make-point 1 2 3) 4 5) - 값
;; 3. (make-point (+ 1 2) 3 4) - (+ 1 2)는 값을 가지고 있지 값이 아니기 때문에 이것은 값이 아니다

;; 8.7.3
(define-struct ball (x y speed-x speed-y))
;; 1.
(number? (make-ball 1 2 3 4)) ; false
;; 2.
(ball-speed-y (make-ball (+ 1 2) (+ 3 3) 2 3)) ; 3
;; 3.
(ball-y (make-ball (+ 1 2) (+ 3 3) 2 3)) ; 6

