#lang racket/base

(require lang/htdp-beginner)

(provide hit?)

;; shot --> Boolean
;; Purpose: To determine if the given shot has hit the given alien
(define (hit? a-shot an-alien)
  (and (posn? a-shot)
       (= (posn-x a-shot) (posn-x an-alien))
       (= (posn-y a-shot) (posn-y an-alien))))