#lang racket/base

(require lang/htdp-beginner
         "./Tick-Moving-Functions.rkt")

(provide (all-defined-out))


;;Alien -> Alien
;;Purpose: Moves the given alien to the right
(define (move-alien-right an-alien)
  (make-posn (move-right-image-x (posn-x an-alien)) (posn-y an-alien)))


;;Alien -> Alien
;;Purpose: Moves the given alien to the left
(define (move-alien-left an-alien)
  (make-posn (move-left-image-x (posn-x an-alien)) (posn-y an-alien)))


;;Alien -> Alien
;;Purpose: Moves the given alien to the down
(define (move-alien-down an-alien)
  (make-posn (posn-x an-alien) (move-down-image-y (posn-y an-alien))))