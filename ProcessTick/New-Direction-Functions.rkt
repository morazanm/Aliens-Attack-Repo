#lang racket/base

(require "../Predicates/Alien-Predicates.rkt"
         "../Contracts/Contracts.rkt"
          racket/contract/region
          (only-in lang/htdp-beginner posn?))

(provide (all-defined-out))


;;<X> alien U (listof alien) --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is down
(define/contract (new-dir-after-down X)
  new-dir-after-down/c
  (let ([func-at-left-edge (if (posn? X) alien-at-left-edge? (λ (x) x))])
    (if (func-at-left-edge X)
          'right
          'left)))
  


;; <X> alien U (listof alien) --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is left
(define/contract (new-dir-after-left X)
  new-dir-after-left/c
  (let ([func-at-left-edge (if (posn? X) alien-at-left-edge? (λ (x) x))])
    (if (func-at-left-edge X)
        'down
        'left)))

;; <X> alien U (listof alien) --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is right
(define/contract (new-dir-after-right X)
  new-dir-after-right/c
  (let ([func-at-right-edge (if (posn? X) alien-at-right-edge? (λ (x) x))])
    (if (func-at-right-edge X)
        'down
        'right)))
