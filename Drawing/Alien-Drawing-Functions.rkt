#lang racket/base

(require 2htdp/image
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))


;; color --> image
;; Purpose: Create an alien image of the given color
(define (mk-alien-img a-color)
  (overlay (text "X" 20 a-color) (circle (/ IMAGE-WIDTH 5) 'solid a-color)))

;;I(David) updated the function so the result is remains a ci. (text "X" 25 a-color) -> (text "X" 20 a-color), (/ IMAGE-WIDTH 4) -> (/ IMAGE-WIDTH 5)

