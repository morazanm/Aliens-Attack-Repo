#lang racket/base


(require 2htdp/image
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))

;; image-x --> pixel-x
;; Purpose: To translate the given image-x to a pixel-x
(define (image-x->pix-x ix)
  (+ (* ix IMAGE-WIDTH) (/ IMAGE-WIDTH 2)))

;; image-y --> pixel-y
;; Purpose: To translate the given image-y to a pixel-y
(define (image-y->pix-y iy)
  (+ (* iy IMAGE-HEIGHT) (/ IMAGE-HEIGHT 2)))

;; image image-x image-y image --> image
;; Purpose: Place the first given image in the seocond given image at the given image coordinates
(define (draw-ci char-img an-img-x an-img-y scn)
  (place-image char-img (image-x->pix-x an-img-x) (image-y->pix-y an-img-y) scn))




