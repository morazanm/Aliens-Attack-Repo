#lang racket/base

(require lang/htdp-beginner
         "./Tick-Moving-Functions.rkt"
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))


;;Alien -> Alien
;;Purpose: Moves the given alien to the right
(define/contract (move-alien-right an-alien)
  move-alien-right/c
  (make-posn (move-right-image-x (posn-x an-alien)) (posn-y an-alien)))


;;Alien -> Alien
;;Purpose: Moves the given alien to the left
(define/contract (move-alien-left an-alien)
  move-alien-left/c
  (make-posn (move-left-image-x (posn-x an-alien)) (posn-y an-alien)))


;;Alien -> Alien
;;Purpose: Moves the given alien to the down
(define/contract (move-alien-down an-alien)
  move-alien-down/c
  (make-posn (posn-x an-alien) (move-down-image-y (posn-y an-alien))))