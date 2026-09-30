#lang racket/base


(require (only-in lang/htdp-beginner make-posn)
         "../Constants/E-Scene-Constants.rkt"
         "../Contracts/Contracts.rkt"
         racket/contract/region)

(provide (all-defined-out))

;; rocket --> shot
;; Purpose: To process a shoot attempt
(define (make-shot a-rocket)
  (make-posn a-rocket MAX-IMG-Y))