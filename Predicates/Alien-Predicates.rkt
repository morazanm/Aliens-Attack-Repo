#lang racket/base

(require "../Constants/E-Scene-Constants.rkt"
         (only-in racket/list empty? first rest)
         (only-in lang/htdp-beginner posn-x posn-y))

(provide (all-defined-out))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the right edge
(define (alien-at-right-edge? an-alien)
  (= (posn-x an-alien) MAX-IMG-X))

;; loa --> Boolean
;; Purpose: To determine if any alien is at scene's right edge
(define (any-alien-at-right-edge? a-loa)
  (and (not (empty? a-loa))
       (or (alien-at-right-edge? (first a-loa))
           (any-alien-at-right-edge? (rest a-loa)))))

;; alien --> Boolean
;; Purpose: Determine if he given alien is at the left edge
(define (alien-at-left-edge? an-alien)
  (= (posn-x an-alien) MIN-IMG-X))

;; loa --> Boolean
;; Purpose: To determine if any alien is at scene's left edge
(define (any-alien-at-left-edge? a-loa)
  (and (not (empty? a-loa))
       (or (alien-at-left-edge? (first a-loa))
           (any-alien-at-left-edge? (rest a-loa)))))


;; alien --> Boolean
;; Purpose: Determine if the given alien reached earth
(define (alien-reached-earth? an-alien)
  (= (posn-y an-alien) MAX-IMG-Y))

;; loa --> Boolean
;; Purpose: Determine if any alien has reached earth
(define (any-alien-reached-earth? a-loa)
  (and (not (empty? a-loa))
       (or (alien-reached-earth? (first a-loa))
           (any-alien-reached-earth? (rest a-loa)))))

;; loa --> Boolean
;; Purpose: Determine if there is a posn alien in the given loa
(define (any-aliens-alive? a-loa) (not (empty? a-loa)))

