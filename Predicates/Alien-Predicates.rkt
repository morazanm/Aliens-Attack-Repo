#lang racket/base

(require "../Constants/E-Scene-Constants.rkt"
         (only-in lang/htdp-beginner empty? posn-x posn-y)
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the right edge
(define/contract (alien-at-right-edge? an-alien)
  alien-at-right-edge?/c
  (= (posn-x an-alien) MAX-IMG-X))

;; loa --> Boolean
;; Purpose: To determine if any alien is at scene's right edge
(define (any-alien-at-right-edge? a-loa)
  (ormap alien-at-right-edge? a-loa))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the left edge
(define/contract (alien-at-left-edge? an-alien)
  alien-at-left-edge?/c
  (= (posn-x an-alien) MIN-IMG-X))

;; loa --> Boolean
;; Purpose: To determine if any alien is at scene's left edge
(define (any-alien-at-left-edge? a-loa)
  (ormap alien-at-left-edge? a-loa))


;; alien --> Boolean
;; Purpose: Determine if the given alien reached earth
(define/contract (alien-reached-earth? an-alien)
  alien-reached-earth?/c
  (= (posn-y an-alien) MAX-IMG-Y))

;; loa --> Boolean
;; Purpose: Determine if any alien has reached earth
(define (any-alien-reached-earth? a-loa)
  (ormap alien-reached-earth? a-loa))

;; loa --> Boolean
;; Purpose: Determine if there is a posn alien in the given loa
(define (any-aliens-alive? a-loa) (not (empty? a-loa)))

