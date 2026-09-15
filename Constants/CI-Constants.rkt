#lang racket/base

(require "./Image-Constants.rkt"
         "./Color-Constants.rkt"
         2htdp/image)

(provide (all-defined-out))

;;ALIEN-CI
;; Sample expressions for mk-alien-img
(define ALIEN-IMG (overlay (text "X" 25 ALIEN-COLOR) (circle (/ IMAGE-WIDTH 4) 'solid ALIEN-COLOR)))
(define ALIEN-IMG2 (overlay (text "X" 25 ALIEN-COLOR2) (circle (/ IMAGE-WIDTH 4) 'solid ALIEN-COLOR2)))

;;SHOT-CI
;; Sample expressions for mk-shot-img
(define SHOT-IMG (radial-star 8
                              (/ IMAGE-WIDTH 8)
                              (/ IMAGE-WIDTH 2)
                              'solid
                              SHOT-COLOR))

(define SHOT-IMG2 (radial-star 8
                               (/ IMAGE-WIDTH 8)
                               (/ IMAGE-WIDTH 2)
                               'solid
                               SHOT-COLOR2))

;;ROCKET-CI
;; Sample expressions for mk-fuselage-img
(define FUSELAGE (circle (* 1/3 IMAGE-HEIGHT)
                         'solid
                         FUSELAGE-COLOR))

(define FUSELAGE2 (circle (* 1/3 IMAGE-HEIGHT)
                          'solid
                          FUSELAGE2-COLOR))

(define FUSELAGE-W (image-width FUSELAGE))
(define FUSELAGE-H (image-width FUSELAGE)) ;;COULD BE REMOVED?

(define FUSELAGE2-W (image-width FUSELAGE2)) ;;COULD BE REMOVED?
(define FUSELAGE2-H (image-width FUSELAGE2)) ;;COULD BE REMOVED?

;; Sample expressions for mk-window-img
(define WINDOW  (ellipse 3 10 'solid WINDOW-COLOR))
(define WINDOW2  (ellipse 3 10 'solid WINDOW2-COLOR))

;; Sample expressions for mk-single-booster-img
(define SINGLE-BOOSTER (rotate 180 (triangle (/ FUSELAGE-W 2) 'solid NACELLE-COLOR)))
(define SINGLE-BOOSTER2 (rotate 180 (triangle (/ FUSELAGE-W 2) 'solid NACELLE2-COLOR)))

(define BOOSTER (beside SINGLE-BOOSTER SINGLE-BOOSTER))
(define BOOSTER2 (beside SINGLE-BOOSTER2 SINGLE-BOOSTER2))

;; Sample expressions for mk-rocket-main-img
(define ROCKET-MAIN (place-image WINDOW
                                 (/ (image-width FUSELAGE) 2)
                                 (/ (image-height FUSELAGE) 4)
                                 (above FUSELAGE BOOSTER)))

(define ROCKET-MAIN2 (place-image WINDOW2
                                  (/ (image-width FUSELAGE2) 2)
                                  (/ (image-height FUSELAGE2) 4)
                                  (above FUSELAGE2 BOOSTER2)))

;; Sample expressions for mk-nacelle-img
(define NACELLE (rectangle (image-width ROCKET-MAIN)
                           (/ (image-height ROCKET-MAIN) 4)
                           'solid
                           NACELLE-COLOR))

(define NACELLE2 (rectangle (image-width ROCKET-MAIN2)
                            (/ (image-height ROCKET-MAIN2) 4)
                            'solid
                            NACELLE2-COLOR))

(define ROCKET-IMG (place-image NACELLE
                                (/ (image-width  ROCKET-MAIN) 2)
                                (* 0.7 (image-height ROCKET-MAIN))
                                ROCKET-MAIN))

(define ROCKET-IMG2 (place-image NACELLE2
                                 (/ (image-width  ROCKET-MAIN2) 2)
                                 (* 0.7 (image-height ROCKET-MAIN2))
                                 ROCKET-MAIN2))