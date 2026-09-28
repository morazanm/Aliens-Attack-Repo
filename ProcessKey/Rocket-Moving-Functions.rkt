#lang racket/base


(require "../Constants/E-Scene-Constants.rkt"
         "../Contracts/Contracts.rkt"
         racket/contract)

(provide (all-defined-out))

;; rocket --> rocket
;; Purpose: Move the given rocket right
(define/contract (move-rckt-right a-rocket)
  move-rckt-right/c
  (if (< a-rocket (sub1 MAX-CHARS-HORIZONTAL))
      (add1 a-rocket)
      a-rocket))


;; rocket --> rocket
;; Purpose: Move the given rocket left
(define/contract (move-rckt-left a-rocket)
  move-rckt-left/c
  (if (> a-rocket 0)
      (sub1 a-rocket)
      a-rocket))