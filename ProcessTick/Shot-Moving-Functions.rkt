#lang racket/base

(require (only-in lang/htdp-beginner make-posn posn-y posn-x)
         "../Constants/Shot-Constants.rkt"
         "../Constants/E-Scene-Constants.rkt"
         "./Tick-Moving-Functions.rkt"
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))


;;Shot -> Shot
;;Purpose: Moves the given shot to the right
(define/contract (move-shot-up a-shot)
  move-shot-up/c
  (cond [(eq? a-shot NO-SHOT) a-shot]
        [(= (posn-y a-shot) MIN-IMG-Y) NO-SHOT]
        [else (make-posn (posn-x a-shot) (move-up-image-y (posn-y a-shot)))]))
