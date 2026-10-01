#lang racket/base

(require "../Predicates/Alien-Predicates.rkt"
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))


;; alien --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is down
(define/contract (new-dir-after-down an-alien)
  new-dir-after-down/c
  (if (alien-at-left-edge? an-alien)
      'right
      'left))


 ;; alien --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is left
(define/contract (new-dir-after-left an-alien)
  new-dir-after-left/c
  (if (alien-at-left-edge? an-alien)
      'down
      'left))

;; alien --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is right
(define/contract (new-dir-after-right an-alien)
  new-dir-after-right/c
  (if (alien-at-right-edge? an-alien)
      'down
      'right))