#lang racket/base

(require "../Constants/E-Scene-Constants.rkt"
         (only-in lang/htdp-beginner posn-x posn-y)
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the right edge
(define/contract (alien-at-right-edge? an-alien)
  alien-at-right-edge?/c
  (= (posn-x an-alien) MAX-IMG-X))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the left edge
(define/contract (alien-at-left-edge? an-alien)
  alien-at-left-edge?/c
  (= (posn-x an-alien) MIN-IMG-X))

;; alien --> Boolean
;; Purpose: Determine if the given alien reached earth
(define/contract (alien-reached-earth? an-alien)
  alien-reached-earth?/c
  (= (posn-y an-alien) MAX-IMG-Y))