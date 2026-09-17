#lang racket/base


(require "../Constants/E-Scene-Constants.rkt")

(provide (all-defined-out))

;; rocket --> rocket
;; Purpose: Move the given rocket right
(define (move-rckt-right a-rocket)
  (if (< a-rocket (sub1 MAX-CHARS-HORIZONTAL))
      (add1 a-rocket)
      a-rocket))


;; rocket --> rocket
;; Purpose: Move the given rocket left
(define (move-rckt-left a-rocket)
  (if (> a-rocket 0)
      (sub1 a-rocket)
      a-rocket))