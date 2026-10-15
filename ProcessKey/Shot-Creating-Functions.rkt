#lang racket/base


(require (only-in lang/htdp-beginner make-posn)
         "../Constants/E-Scene-Constants.rkt"
         "../Constants/Shot-Constants.rkt"
         "../Contracts/Contracts.rkt"
         racket/contract/region)

(provide (all-defined-out))

;; shot rocket --> shot
;; Purpose: To process a shoot attempt
(define/contract (make-shot a-shot a-rocket)
  make-shot/c
  (if (eq? a-shot NO-SHOT)
      (make-posn a-rocket MAX-IMG-Y)
      a-shot))


;; rocket -> shot
;; Purpose: To create a new shot
(define/contract (process-shooting a-rocket)
  process-shooting/c
  (make-posn a-rocket MAX-IMG-Y))