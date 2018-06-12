#lang racket

;; Scheme의 어휘: 변수, 상수(불린, 기호, 수), 연산
;; (변수) <var> = x | area-of-disk | perimeter | ... 
;; (상수) <con> = true | false
;;                'a | 'doll | 'sum | ...
;;                1 | -1 | 3/5 | 1.22 | ...
;; (연산) <prm> = + | - | ...
;; Scheme의 문법
;; (정의) <def> =   (define (<var> <var> ... <var>) <exp>)
;; (표현) <exp> =   <var>
;;                | <con>
;;                | (<prm> <exp> ... <exp>)
;;                | (<var> <exp> ... <exp>)
;;                | (cond (<exp> <exp>) ... (<exp> <exp>))
;;                | (cond (<exp> <exp>) ... (else <exp>))

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

