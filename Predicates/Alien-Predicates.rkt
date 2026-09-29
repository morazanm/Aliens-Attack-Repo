#lang racket/base

(require "../Constants/E-Scene-Constants.rkt"
         (only-in lang/htdp-beginner posn-x posn-y))

(provide (all-defined-out))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the right edge
(define (alien-at-right-edge? an-alien)
  (= (posn-x an-alien) MAX-IMG-X))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the left edge
(define (alien-at-left-edge? an-alien)
  (= (posn-x an-alien) MIN-IMG-X))

;; alien --> Boolean
;; Purpose: Determine if the given alien reached earth
(define (alien-reached-earth? an-alien)
  (= (posn-y an-alien) MAX-IMG-Y))