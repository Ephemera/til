;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname chapter6) (read-case-sensitive #t) (teachpacks ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "convert.rkt" "teachpack" "htdp") (lib "draw.rkt" "teachpack" "htdp")) #f)))
(define WIDTH 50)
(define HEIGHT 160)
(define BULB-RADIUS 20)
(define BULB-DISTANCE 10)

(define X-BULBS (quotient WIDTH 2))
(define Y-RED (+ BULB-DISTANCE BULB-RADIUS))
(define Y-YELLOW (+ Y-RED BULB-DISTANCE (* 2 BULB-RADIUS)))
(define Y-GREEN (+ Y-YELLOW BULB-DISTANCE (* 2 BULB-RADIUS)))

(start WIDTH HEIGHT)
(draw-solid-disk (make-posn X-BULBS Y-RED) BULB-RADIUS 'red)
(draw-circle (make-posn X-BULBS Y-YELLOW) BULB-RADIUS 'yellow)
(draw-circle (make-posn X-BULBS Y-GREEN) BULB-RADIUS 'green)

;; 6.2.2
;; y : symbol->symbol
(define (Y color)
 (cond
    [(eq? color 'red) Y-RED]
    [(eq? color 'yellow) Y-YELLOW]
    [(eq? color 'green) Y-GREEN]))
;; clear-bulb : symbol->boolean
(define (clear-bulb color)
  (and (draw-solid-disk (make-posn X-BULBS (Y color)) BULB-RADIUS 'white)
       (draw-circle (make-posn X-BULBS (Y color)) BULB-RADIUS color)))

;; 6.2.3
;; draw-bulb : symbol->boolean
(define (draw-bulb color)
  (draw-solid-disk (make-posn X-BULBS (Y color)) BULB-RADIUS color))

;; 6.2.4
;; switch : symbol->boolean
(define (switch old-color new-color)
  (and (clear-bulb old-color)
       (draw-bulb new-color)))

;; 6.5.1
;; 1.
(define-struct movie (title producer))
;; movie는 구조체이며,
;; (make-movie t p)에서 t(제목), p(피디)는 기호이다

;; 계약: subst-producer : movie symbol->movie

;; 목적: 프로듀서 이름이 'ProducerB일 경우 새로운 프로듀서 이름을 갖는 movie 구조체 생성

;; 예:
;; (subst-producer (make-movie 'TitleA 'ProducerA) 'ProducerB)
;; =
;; (make-movie 'Title 'ProducerB)

;; 템플릿:
;; (define (process-movie a-movie a-producer)
;; ... (movie-title a-movie) ...
;; ... (movie-producer a-movie) ...)

;; 정의:
(define (subst-producer a-movie a-producer)
  (cond
    [(symbol=? (movie-producer a-movie) 'ProducerA)
     (make-movie (movie-title a-movie) a-producer)]
    [else a-movie]))

;; 테스트:
(subst-producer (make-movie 'TitleA 'ProducerA) 'ProducerB)
;; 예상값:
(make-movie 'TitleA 'ProducerB)
