#lang racket/base

(require "../../ProcessKey/Shot-Creating-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Shot-Constants.rkt"
         "../../Constants/Rocket-Constants.rkt"
         (only-in lang/htdp-beginner make-posn)
         (only-in rackunit check-equal?))

;; Tests using sample computations for process-shooting
(check-equal? (process-shooting INIT-SHOT INIT-ROCKET) (make-posn INIT-ROCKET MAX-IMG-Y))
(check-equal? (process-shooting SHOT2 INIT-ROCKET)     SHOT2)
(check-equal? (process-shooting SHOT3 INIT-ROCKET2)    SHOT3)

;; Tests using sample values for process-shooting
(check-equal? (process-shooting NO-SHOT 8) (make-posn 8 MAX-IMG-Y))
(check-equal? (process-shooting (make-posn 17 9) 8) (make-posn 17 9))