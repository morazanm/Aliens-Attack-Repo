#lang racket/base

(require (only-in lang/htdp-beginner posn?)
         "../Predicates/Alien-Predicates.rkt")

(provide (all-defined-out))


;;<X> alien U (listof alien) --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is down
(define (new-dir-after-down X)
  (let ([func-at-left-edge (if (posn? X) alien-at-left-edge? (λ (x) x))])
    (if (func-at-left-edge X)
          'right
          'left)))
  


;; <X> alien U (listof alien) --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is left
(define (new-dir-after-left X)
  (let ([func-at-left-edge (if (posn? X) alien-at-left-edge? (λ (x) x))])
    (if (func-at-left-edge X)
        'down
        'left)))

;; <X> alien U (listof alien) --> direction
;; Purpose: Compute the direction of the given alien
;;          when previous direction is right
(define (new-dir-after-right X)
  (let ([func-at-right-edge (if (posn? X) alien-at-right-edge? (λ (x) x))])
    (if (func-at-right-edge X)
        'down
        'right)))