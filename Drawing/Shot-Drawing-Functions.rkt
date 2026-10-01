#lang racket/base


(require 2htdp/image
         (only-in lang/htdp-beginner posn-x posn-y empty? first rest)
         "../Constants/Shot-Constants.rkt"
         "../Constants/CI-Constants.rkt"
         "./Scene-Drawing-Functions.rkt"
         "../Constants/Image-Constants.rkt")

(provide (all-defined-out))

;; color --> image
;; Purpose: Create shot image of the given color
(define (mk-shot-img a-color)
  (radial-star 8 (/ MAX-CI-WIDTH 8) (/ MAX-CI-WIDTH 2) 'solid  a-color))

;; shot scene --> scene
;; Purpose: To draw the shot in the given scene
(define (draw-shot a-shot scn)
  (if (eq? a-shot NO-SHOT)
      scn
      (draw-ci SHOT-IMG (posn-x a-shot) (posn-y a-shot) scn)))

;; shot-img shot scene --> scene
;; Purpose: To draw the shot in the given scene
(define (draw-shot-img shot-img a-shot scn)
  (if (eq? a-shot NO-SHOT)
      scn
      (draw-ci shot-img (posn-x a-shot) (posn-y a-shot) scn)))

;; los scene --> scene
;; Purpose: To draw the given los in the given scene
(define (draw-los a-los scn)
  (if (empty? a-los)
      scn
      (draw-shot (first a-los) (draw-los (rest a-los) scn))))

;; ci los scene --> scene
;; Purpose: To draw the given los in the given scene
(define (draw-los-img shot-img a-los scn)
  (if (empty? a-los)
      scn
      (draw-shot-img shot-img (first a-los) (draw-los (rest a-los) scn))))