#lang racket/base

(require "../../ProcessTick/Tick-Moving-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Alien-Constants.rkt"
         (only-in rackunit check-equal?))


;; Sample tests using sample computations for move-right-image-x
(check-equal? (move-right-image-x MIN-IMG-X) (add1 MIN-IMG-X))
(check-equal? (move-right-image-x 11)        (add1 11))

;; Sample tests using sample computations for move-right-image-x
(check-equal? (move-right-image-x 12) 13)

         
;; Tests using sample computations for move-left-image-x
(check-equal? (move-left-image-x AN-IMG-X)  (sub1 AN-IMG-X))
(check-equal? (move-left-image-x MAX-IMG-X) (sub1 MAX-IMG-X))

;; Tests using sample values for move-left-image-x
(check-equal? (move-left-image-x 9) 8)


;; Tests using sample computations for move-down-image-y
(check-equal? (move-down-image-y MIN-IMG-Y) (add1 MIN-IMG-Y))
(check-equal? (move-down-image-y (floor AN-IMG-Y))  (add1 (floor AN-IMG-Y)))

;; Tests using sample values for move-down-image-y
(check-equal? (move-down-image-y 2)  3)

;; Tests using sample computations for move-up-image-y
(check-equal? (move-up-image-y (floor AN-IMG-Y))  (sub1 (floor AN-IMG-Y)))
(check-equal? (move-up-image-y MAX-IMG-Y) (sub1 MAX-IMG-Y))

;; Tests using sample values for f-on-image-y>min
(check-equal? (move-up-image-y 6)  5)
(check-equal? (move-up-image-y 11) 10)