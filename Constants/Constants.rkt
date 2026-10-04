#lang racket/base

(require "./E-Scene-Constants.rkt"
         "./Image-Constants.rkt"
         "./CI-Constants.rkt"
         "./Tick-Constants.rkt"
         (only-in "./Shot-Constants.rkt" NO-SHOT))

(provide  
 ;; CIs
 #;(rename-out [E-SCENE-W E-SCENE-WIDTH]
             [E-SCENE-H E-SCENE-HEIGHT])
 E-SCENE-W

 E-SCENE-H
 
 E-SCENE
 
 E-SCENE2

 MAX-CI-WIDTH

 MAX-CI-HEIGHT

 MAX-CHARS-HORIZONTAL

 MAX-CHARS-VERTICAL

 MIN-IMG-X

 MAX-IMG-X

 MIN-IMG-Y

 MAX-IMG-Y
 
 ;;Aliens
 ALIEN-IMG

 ALIEN-IMG2

 ;;Shots
 SHOT-IMG

 SHOT-IMG2
 
 ;;Rockets
 ROCKET-IMG

 ROCKET-IMG2

 ;;Tick Rate
 TICK-RATE

 ;;No Shot
 NO-SHOT
 )