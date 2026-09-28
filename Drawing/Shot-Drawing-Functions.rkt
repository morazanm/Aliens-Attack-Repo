#lang racket/base


(require 2htdp/image
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))

;; color --> image
;; Purpose: Create shot image of the given color
(define (mk-shot-img a-color)
  (radial-star 8 (/ MAX-CI-WIDTH 8) (/ MAX-CI-WIDTH 2) 'solid  a-color))