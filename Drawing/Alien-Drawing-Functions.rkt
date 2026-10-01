#lang racket/base

(require 2htdp/image
         (only-in lang/htdp-beginner posn-x posn-y)
         "../Constants/Image-Constants.rkt"
         "../Constants/CI-Constants.rkt"
         "./Scene-Drawing-Functions.rkt"
         "../Contracts/Contracts.rkt"
          racket/contract/region)

(provide (all-defined-out))


;; color --> image
;; Purpose: Create an alien image of the given color
(define (mk-alien-img a-color)
  (overlay (text "X" 25 a-color) (circle (/ MAX-CI-WIDTH 4) 'solid a-color)))

;;There a wierd interaction between windows and linux for this function


;; alien scene --> scene
;; Purpose: Draw the given alien in the given scene
(define/contract (draw-alien an-alien scn)
  draw-alien/c
  (draw-ci ALIEN-IMG (posn-x an-alien) (posn-y an-alien) scn))


;; ci alien scene --> scene
;; Purpose: Draw the given alien in the given scene
(define/contract (draw-alien-img an-alien-img an-alien scn)
  draw-alien-img/c
  (draw-ci an-alien-img (posn-x an-alien) (posn-y an-alien) scn))

