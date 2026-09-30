#lang racket/base

(require (only-in lang/htdp-beginner make-posn posn-y posn-x)
         "../Constants/Shot-Constants.rkt"
         "./Tick-Moving-Functions.rkt")

(provide (all-defined-out))


;;Shot -> Shot
;;Purpose: Moves the given shot to the right
(define (move-shot-up a-shot)
  (if (eq? a-shot NO-SHOT)
      a-shot
      (make-posn (posn-x a-shot) (move-up-image-y (posn-y a-shot)))))
