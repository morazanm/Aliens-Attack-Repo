#lang racket/base

(require lang/htdp-beginner
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide hit?)

;; shot --> Boolean
;; Purpose: To determine if the given shot has hit the given alien
(define/contract (hit? a-shot an-alien)
  hit?/c
  (and (posn? a-shot)
       (= (posn-x a-shot) (posn-x an-alien))
       (= (posn-y a-shot) (posn-y an-alien))))