#lang racket/base

(require 2htdp/image
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))


;; color --> image
;; Purpose: Create an alien image of the given color
(define (mk-alien-img a-color)
  (overlay (text "X" 25 a-color) (circle (/ IMAGE-WIDTH 4) 'solid a-color)))