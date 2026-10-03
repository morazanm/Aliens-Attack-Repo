#lang racket/base

(require "../../ProcessKey/Rocket-Moving-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         (only-in rackunit check-equal?))


;; Tests using sample computations for move-rckt-right
(check-equal? (move-rckt-right 3) (add1 3))
(check-equal? (move-rckt-right (sub1 MAX-CHARS-HORIZONTAL)) (sub1 MAX-CHARS-HORIZONTAL))

;; Tests using sample values for move-rckt-right
(check-equal? (move-rckt-right 0) 1)
(check-equal? (move-rckt-right 15) 16)


;; Tests using sample computations for move-rckt-left
(check-equal? (move-rckt-left 7) (sub1 7))
(check-equal? (move-rckt-left 0) 0)

;; Tests using sample values for move-rckt-left
(check-equal? (move-rckt-left (sub1 MAX-CHARS-HORIZONTAL)) (- MAX-CHARS-HORIZONTAL 2))
(check-equal? (move-rckt-left 14) 13)