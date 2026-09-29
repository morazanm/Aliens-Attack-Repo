#lang racket/base

(require lang/htdp-beginner
         "./Tick-Moving-Functions.rkt")

(provide (all-defined-out))


;;Shot -> Shot
;;Purpose: Moves the given shot to the right
(define (move-shot-up a-shot)
  (make-posn (posn-x a-shot) (move-up-image-y (posn-y a-shot))))
