#lang racket/base

(require (only-in lang/htdp-beginner posn? posn-x posn-y)
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))

;; shot --> Boolean
;; Purpose: To determine if the given shot has hit the given alien
(define/contract (hit? a-shot an-alien)
  hit?/c
  (and (posn? a-shot)
       (= (posn-x a-shot) (posn-x an-alien))
       (= (posn-y a-shot) (posn-y an-alien))))

;; alien los --> Boolean
;; Purpose: To determine if the given alien is hit by any shot in the given los
(define (hit-by-any-shot? an-alien a-los)
  (ormap (λ (shot) (hit? shot an-alien)) a-los))

;; shot loa --> Boolean
;; Purpose: To determine if the given shot has hit any alien in the given loa
(define (hit-any-alien? a-shot a-loa)
  (ormap (λ (alien) (hit? a-shot alien)) a-loa))