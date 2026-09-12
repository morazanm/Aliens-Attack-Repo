#lang racket/base


(require "./Constants/Constants.rkt"
         "./Drawing/Drawing-Functions.rkt"
         "./Predicates/Predicates.rkt"
         "./ProcessTick/ProcessTick-Functions.rkt"
         "./ProcessKey/ProcessKey-Functions.rkt"
         "./GameOver/GameOver-Functions.rkt")

(provide
 ;;CONSTANTS
 ;;Image Constants
 IMAGE-WIDTH

 IMAGE-HEIGHT

 ;;Color Constants
 SHOT-COLOR

 SHOT-COLOR2
 
 ALIEN-COLOR

 ALIEN-COLOR2

 WINDOW-COLOR

 WINDOW2-COLOR   

 FUSELAGE-COLOR 

 FUSELAGE2-COLOR

 NACELLE-COLOR

 NACELLE2-COLOR

 ;;E-SCENE Constants
 MAX-CHARS-HORIZONTAL

 MAX-CHARS-VERTICAL

 E-SCENE-W

 E-SCENE-H

 E-SCENE-COLOR

 E-SCENE

 AN-IMG-X

 MIN-IMG-X

 MAX-IMG-X

 AN-IMG-Y

 MIN-IMG-Y
 
 MAX-IMG-Y

 ROCKET-Y
 
 ;; CIs
 
 ;;Aliens
 ALIEN-IMG

 ALIEN-IMG2

 ;;Shots
 SHOT-IMG

 SHOT-IMG2
 
 ;;Rockets
 FUSELAGE

 FUSELAGE2

 FUSELAGE-W

 WINDOW

 WINDOW2

 SINGLE-BOOSTER

 SINGLE-BOOSTER2

 BOOSTER

 BOOSTER2

 ROCKET-MAIN

 ROCKET-MAIN2

 NACELLE

 NACELLE2

 ROCKET-IMG

 ROCKET-IMG2
 
 ;;DRAWING FUNCTIONS
 
 ;;Alien Drawing Functions
 mk-alien-img

 ;;Shot Drawing Functions
 mk-shot-img

 ;;Rocket Drawing Functions
 mk-fuselage-img

 mk-window-img

 mk-single-booster-img

 mk-booster-img

 mk-rocket-main-img

 mk-nacelle-img

 mk-rocket-ci

 ;;Scene Drawing Functions
 image-x->pix-x

 image-y->pix-y

 draw-ci

 ;;Predicates

 ci?

 )