#lang racket/base

(require 2htdp/image
         rackunit
         "../../Predicates/Image-Predicates.rkt"
         "../../Drawing/Alien-Drawing-Functions.rkt"
         "../../Drawing/Shot-Drawing-Functions.rkt"
         "../../Drawing/Rocket-Drawing-Functions.rkt"
         "../../Constants/Constants.rkt"
         "../../Constants/Image-Constants.rkt")


;; Sample expressions for ci?
(define IS-CI (and (<= (image-width (circle 10 'solid 'red)) IMAGE-WIDTH)
                   (<= (image-height (circle 10 'solid 'red)) IMAGE-HEIGHT)))

(define NOT-CI (and (<= (image-width  (square 40 'solid 'blue)) IMAGE-WIDTH)
                    (<= (image-height (square 40 'solid 'blue)) IMAGE-HEIGHT)))

(define NOT-CI2 (and (<= (image-width  (rectangle 20 40 'solid 'blue)) IMAGE-WIDTH)
                     (<= (image-height (rectangle 20 40 'solid 'blue)) IMAGE-HEIGHT)))

;; Tests using sample computations for ci?
(check-equal? (ci? (circle 10 'solid 'red))  IS-CI)

(check-equal? (ci? (square 40 'solid 'blue)) NOT-CI)

(check-equal? (ci? (rectangle 20 40 'solid 'blue)) NOT-CI2)

;; Tests using sample values for ci?
(check-pred ci? (ellipse 10 22 'outline 'green))

(check-false (ci? (rectangle 5 33 'solid 'yellow)))

;;Drawing Functions

;;Draw Alien
(check-pred ci? ALIEN-IMG)

(check-pred ci? ALIEN-IMG2)

(check-pred ci? (mk-alien-img 'purple))

(check-pred ci? (mk-alien-img 'lightbrown))

;;Draw Shot
(check-pred ci? SHOT-IMG)

(check-pred ci? SHOT-IMG2)

(check-pred ci? (mk-shot-img 'red))

(check-pred ci? (mk-shot-img 'brown))

;;Draw Rocket
(check-pred ci? ROCKET-IMG)

(check-pred ci? ROCKET-IMG2)