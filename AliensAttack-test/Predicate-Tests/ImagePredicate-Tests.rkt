#lang racket/base

(require 2htdp/image
         rackunit
         "../../Predicates/Image-Predicates.rkt"
         "../../Drawing/Drawing-Functions.rkt"
         "../../Constants/Constants.rkt")


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
(check-true (ci? (ellipse 10 22 'outline 'green))  #true)

(check-false (ci? (rectangle 5 33 'solid 'yellow)) #false)

;;Drawing Functions

;;Draw Alien
(check-true (ci? ALIEN-IMG) #true)

(check-true (ci? ALIEN-IMG2) #true)

(check-true (ci? (mk-alien-img 'purple)) #true)

(check-true (ci? (mk-alien-img 'lightbrown)) #true)

;;Draw Shot
(check-true (ci? SHOT-IMG) #true)

(check-true (ci? SHOT-IMG2) #true)

(check-true (ci? (mk-shot-img 'red)) #true)

(check-true (ci? (mk-shot-img 'brown)) #true)

;;Draw Rocket
(check-true (ci? ROCKET-IMG)  #true)

(check-true (ci? ROCKET-IMG2) #true)