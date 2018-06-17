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

;; 9.3.3
;; contains? : a-list-of-symbols->boolean
(define (contains? target a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) false]
    [else (or (symbol=? (first a-list-of-symbols) target)
              (contains? (rest a-list-of-symbols)))]))


;; 9.5.1
(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))

(sum empty)
(sum (cons 1.00 empty))
(sum (cons 17.05 (cons 1.22 (cons 2.59 empty))))

;; 9.5.2
(define (how-many-symbols a-list-of-symbols)
  (cond
    [(empty? a-list-of-symbols) 0]
    [else (+ 1 (how-many-symbols (rest a-list-of-symbols)))]))

(= 3 (how-many-symbols (cons 'a (cons 'b (cons 'c empty)))))

;; 9.5.3
(define (dollar-store? a-list-of-costs)
  (cond
    [(empty? a-list-of-costs) true]
    [(> (first a-list-of-costs) 1) false]
    [else (dollar-store? (rest a-list-of-costs))]))

(equal? (dollar-store? empty) true)
(equal? (not (dollar-store? (cons .75 (cons 1.95 (cons .25 empty))))) true)
(equal? (dollar-store? (cons .75 (cons .95 (cons .25 empty)))) true)

;; 9.5.4
(define (check-range1 a-list-of-measures)
  (cond
    [(empty? a-list-of-measures) true]
    [(or (>= 5 (first a-list-of-measures)) (<= 95 (first a-list-of-measures))) false]
    [else (check-range1 (rest a-list-of-measures))]))

(define (check-range a-list-of-measures minimum maximum)
  (cond
    [(empty? a-list-of-measures) true]
    [(or (>= minimum (first a-list-of-measures)) (<= maximum (first a-list-of-measures))) false]
    [else (check-range (rest a-list-of-measures))]))

;; 9.5.7
(define (sum a-list-of-nums)
  (cond
    [(empty? a-list-of-nums) 0]
    [else (+ (first a-list-of-nums) (sum (rest a-list-of-nums)))]))
(define (how-many a-list)
  (cond
    [(empty? a-list) 0]
    [else (+ 1 (how-many (rest a-list)))]))
(define (average-price a-list-of-prices)
  (cond
    [(empty? a-list-of-prices) (error "it is empty")]
    [else (/ (sum a-list-of-prices) (how-many a-list-of-prices))]))

