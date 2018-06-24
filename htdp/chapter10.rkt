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


;; 10.2.1
(define-struct ir (name price)
(define (contains-doll? an-inv)
  (cond
    [(empty? an-inv) false]
    [else (cond
            [(symbol=? (ir-name (first an-inv)) 'doll) true]
            [else (contains-coll? (rest an-inv))])]))

(define (contains? asymbol an-inv)
  (cond
    [(empty? an-inv) false]
    [else (cond
            [(symbol=? (ir-name (first an-inv)) asymbol) true]
            [else (contains-coll? asymbol (rest an-inv))])]))

;; 10.2.4
(define-struct phonebook (name number))

(define (whose-number anumber alop)
  (cond
    [(empty? alop) 'nothing]
    [else (cond
            [(symbol=? (phonebook-number (first alop)) anumber) (phonebook-name (first alop))]
            [else (whose-number anumber (rest alop))])]))

(define (phone-number aname alop)
  (cond
    [(empty? alop) 'nothing]
    [else (cond
            [(symbol=? (phonebook-name (first alop)) aname) (phonebook-number (first alop))]
            [else (phone-number aname (rest alop))])]))

;; 10.2.5
(define (extract>1 an-inv)
  (cond
    [(empty? an-inv) empty]
    [else (cond
            [(> (ir-price (first an-inv)) 1.00)
             (cons (first an-inv) (extract>1 (rest an-inv)))]
            [else (extract>1 (rest an-inv))])]))

;; 10.2.7
(define (raise-prices an)
  (cond
    [(empty? an-inv) empty]
    [else (cons (make-ir (* (ir-price (first an-inv)) 1.05) (ir-name first an-inv)) (raise-prices (rest an-inv)))]))
