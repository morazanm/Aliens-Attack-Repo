#lang racket/base

(require "../../ProcessKey/Shot-Creating-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Shot-Constants.rkt"
         "../../Constants/Rocket-Constants.rkt"
         (only-in lang/htdp-beginner make-posn)
         (only-in rackunit check-equal?))

;; Tests using sample computations for make-shot
(check-equal? (make-shot INIT-SHOT INIT-ROCKET) (make-posn INIT-ROCKET MAX-IMG-Y))
(check-equal? (make-shot SHOT2 INIT-ROCKET)     SHOT2)
(check-equal? (make-shot SHOT3 INIT-ROCKET2)    SHOT3)

;; Tests using sample values for make-shot
(check-equal? (make-shot NO-SHOT 8) (make-posn 8 MAX-IMG-Y))
(check-equal? (make-shot (make-posn 17 9) 8) (make-posn 17 9))



;; Tests using sample values for process-shooting
(check-equal? (process-shooting 8) (make-posn 8 MAX-IMG-Y))
(check-equal? (process-shooting INIT-ROCKET) (make-posn INIT-ROCKET MAX-IMG-Y))