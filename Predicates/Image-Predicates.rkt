#lang racket/base

(require 2htdp/image
         "../Constants/Image-Constants.rkt"
         "../Contracts/Contracts.rkt"
         racket/contract/region)

(provide (all-defined-out))

;; image --> Boolean
;; Purpose: To determine if the given image is a ci
(define/contract (ci? an-img)
  ci?/c
  (and (<= (image-width an-img)  IMAGE-WIDTH)
       (<= (image-height an-img) IMAGE-HEIGHT)))