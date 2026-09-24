#lang racket/base

(require 2htdp/image
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))

;; image --> Boolean
;; Purpose: To determine if the given image is a ci
(define (ci? an-img)
  (and (<= (image-width an-img)  MAX-CI-WIDTH)
       (<= (image-height an-img) MAX-CI-HEIGHT)))