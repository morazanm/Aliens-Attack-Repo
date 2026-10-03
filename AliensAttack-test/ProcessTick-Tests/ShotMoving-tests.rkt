#lang racket/base

(require "../../ProcessTick/Shot-Moving-Functions.rkt"
         "../../ProcessTick/Tick-Moving-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Shot-Constants.rkt"
         "../../Constants/Alien-Constants.rkt"
         (only-in lang/htdp-beginner rest first cons make-posn posn-x posn-y)
         (only-in rackunit check-equal?))

;; Tests using sample computations for move-shot
(check-equal? (move-shot INIT-SHOT) INIT-SHOT)
(check-equal? (move-shot SHOT2) (make-posn (posn-x SHOT2) (move-up-image-y (posn-y SHOT2))))
(check-equal? (move-shot SHOT4) NO-SHOT)

;; Tests using sample values for move-shot
(check-equal? (move-shot (make-posn 5 5)) (make-posn 5 4))
(check-equal? (move-shot (make-posn 5 MIN-IMG-Y)) NO-SHOT)


;; Tests using sample computations for move-los
(check-equal? (move-los INIT-LOS) INIT-LOS)
(check-equal? (move-los LOS2)     (cons (move-shot (first LOS2))
                                        (move-los  (rest LOS2))))

;; Tests using sample values for move-los
(check-equal? (move-los (cons (make-posn 12 7)
                              (cons NO-SHOT '())))
              (cons (make-posn 12 6)
                    (cons NO-SHOT '())))

;; Tests using sample computations for remove-shots
(check-equal? (remove-shots INIT-LOS INIT-LOA) INIT-LOS)
(check-equal? (remove-shots LOS2 (list (make-posn 1 9) (make-posn 8 0)))
              (remove-shots (rest LOS2) LOA3))
(check-equal? (remove-shots LOS2 (list (make-posn 1 9) (make-posn 8 5)))
              (cons (make-posn 8 0)
                              (remove-shots (rest LOS2) LOA4)))
     

;; Tests using sample values for remove-shots
(check-equal? (remove-shots (list (make-posn 2 9) (make-posn 10 10))
                            INIT-LOA)
              (list (make-posn 2 9) (make-posn 10 10)))
(check-equal? (remove-shots (list (make-posn 8 2) (make-posn 13 1))
                            INIT-LOA)
              '())
