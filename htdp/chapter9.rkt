#lang racket

;; 9.1.1
;; 1. solar system
(cons 'Mercury
      (cons 'Venus
            (cons 'Earth
                  (cons 'Mars
                        (cons 'Jupiter
                              (cons 'Saturn
                                    (cons 'Uranus
                                          (cons 'Neptune empty))))))))

;; 9.1.2
(define l (cons 10 (cons 20 (cons 5 empty))))

(rest l) ; '(20 5)
(first (rest l)) ; 20
(rest (rest l)) ; '(5)
(first (rest (rest l))) ; 5
(rest (rest (rest l))) ; '()

;; 9.1.3
;; add-up-3 : a-list-of-3-numbers->number
(define (add-up-3 a-list-of-3-numbers)
  (+ (first a-list-of-3-numbers)
     (first (rest a-list-of-3-numbers))
     (first (rest (rest a-list-of-3-numbers)))))
;; test
(= (add-up-3 (cons 2 (cons 1 (cons 3 empty)))) 6)
;; distance-to-0-for-3 : a-list-of-3-positions->number
(define (distance-to-0-for-3 a-list-of-3-positions)
  (sqrt
    (+ (sqr (first a-list-of-3-positions))
       (sqr (first (rest a-list-of-3-positions)))
       (sqr (first (rest (rest a-list-of-3-positions)))))))

;; 9.1.4
;; contains-2-doll : a-list-of-2-symbols->boolean
(define (contains-2-doll? a-list-of-2-symbols)
  (cons
    [(equal? (first a-list-of-2-symbols) 'doll) true]
    [(equal? (first (rest a-list-of-2-symbols) 'doll)) true]
    [else false]))


;; 9.3.1
(define (contains-doll? a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (cond
            [(symbol=? (first a-list-of-symbols) 'doll) true]
            [else (contains-doll? (rest a-list-of-symbols))])]))

(contains-doll? empty) ; false
(contains-doll? (cons 'ball empty)) ; false
(contains-doll? (cons 'arrow (cons 'doll empty))) ; true
(contains-doll? (cons 'bow (cons 'arrow (cons 'ball empty)))) ; false

;; 9.3.2
(define (re-contains-doll? a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (or (symbol=? (first a-list-of-symbols) 'doll)
              (contains-doll? (rest a-list-of-symbols)))]))

