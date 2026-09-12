#lang racket/base


(require 2htdp/image
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))

;; color --> image
;; Purpose: Create the fuselage image of the given color
(define (mk-fuselage-img a-color)
  ;(ellipse IMAGE-WIDTH (* 2/3 IMAGE-HEIGHT) 'solid a-color))
  (circle (* 1/3 IMAGE-HEIGHT) 'solid a-color))

;; color --> image
;; Purpose: Create rocket window image
(define (mk-window-img a-color)
  (ellipse 3 10 'solid a-color))

;; color --> image
;; Purpose: Create single booster image
(define (mk-single-booster-img a-color)
  (let ([FUSELAGE-W (image-width (mk-fuselage-img 'blue))])
    (rotate 180 (triangle (/ FUSELAGE-W 2) 'solid a-color))))

;; image --> image
;; Purpose: Create booster image
(define (mk-booster-img a-sb-img)
  (beside a-sb-img a-sb-img))

;; image image image --> image
;; Purpose: Create the main rocket image
(define (mk-rocket-main-img a-window a-fuselage a-booster)
  (place-image a-window
               (/ (image-width a-fuselage) 2)
               (/ (image-height a-fuselage) 4)
               (above a-fuselage a-booster)))


;; image color --> image
;; Purpose: Create a rocket nacelle image
(define (mk-nacelle-img a-rocket-main-img a-color)
  (rectangle (image-width a-rocket-main-img)
             (/ (image-height a-rocket-main-img) 4)
             'solid
             a-color))


;; image image --> ci
;; Purpose: Create a rocket ci
(define (mk-rocket-ci a-rocket-main-img a-nacelle-img)
  (place-image a-nacelle-img
               (/ (image-width  a-rocket-main-img) 2)
               (* 0.7 (image-height a-rocket-main-img))
               a-rocket-main-img))




