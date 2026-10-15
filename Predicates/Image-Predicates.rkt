#lang racket/base

(require (only-in 2htdp/image image-width image-height)
         "../Constants/Image-Constants.rkt"
         "../Contracts/Contracts.rkt"
         racket/contract/region)

(provide (all-defined-out))

;; image --> Boolean
;; Purpose: To determine if the given image is a ci
(define/contract (ci? an-img)
  ci?/c
  (and (<= (image-width an-img)  MAX-CI-WIDTH)
       (<= (image-height an-img) MAX-CI-HEIGHT)))
