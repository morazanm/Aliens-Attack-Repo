#lang racket/base

(require "../../ProcessKey/Rocket-Moving-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         rackunit)


;; Sample expressions for move-rckt-right
(define ROCKET-VAL3 (add1 3))
(define ROCKET-VALMAX (sub1 MAX-CHARS-HORIZONTAL))

;; Tests using sample computations for move-rckt-right
(check-equal? (move-rckt-right 3) ROCKET-VAL3)
(check-equal? (move-rckt-right (sub1 MAX-CHARS-HORIZONTAL)) ROCKET-VALMAX)

;; Tests using sample values for move-rckt-right
(check-equal? (move-rckt-right 0) 1)
(check-equal? (move-rckt-right 15) 16)

;; Sample expressions for move-rckt-left
(define ROCKET-VAL7 (sub1 7))
(define ROCKET-VAL0 0)

;; Tests using sample computations for move-rckt-left
(check-equal? (move-rckt-left 7) ROCKET-VAL7)
(check-equal? (move-rckt-left 0) 0)

;; Tests using sample values for move-rckt-left
(check-equal? (move-rckt-left (sub1 MAX-CHARS-HORIZONTAL)) (- MAX-CHARS-HORIZONTAL 2))
(check-equal? (move-rckt-left 14) 13)