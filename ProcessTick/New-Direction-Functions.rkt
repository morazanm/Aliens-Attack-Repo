#lang racket/base

(require "../Predicates/Alien-Predicates.rkt")

(provide (all-defined-out))


;; alien --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is down
(define (new-dir-after-down an-alien)
  (if (alien-at-left-edge? an-alien)
      'right
      'left))


 ;; alien --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is left
(define (new-dir-after-left an-alien)
  (if (alien-at-left-edge? an-alien)
      'down
      'left))

;; alien --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is right
(define (new-dir-after-right an-alien)
  (if (alien-at-right-edge? an-alien)
      'down
      'right))