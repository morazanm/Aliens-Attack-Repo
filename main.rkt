#lang racket/base


(require "./Constants/Constants.rkt"
         "./Drawing/Drawing-Functions.rkt"
         "./Predicates/Predicates.rkt"
         "./ProcessTick/ProcessTick-Functions.rkt"
         "./ProcessKey/ProcessKey-Functions.rkt"
         "./GameOver/GameOver-Functions.rkt")

  (provide
   ;;CONSTANTS
   MIN-IMG-X

   MAX-IMG-X

   MIN-IMG-Y

   MAX-IMG-Y
   
   E-SCENE-W

   E-SCENE-H
 
   E-SCENE

   E-SCENE2

   MAX-CI-WIDTH

   MAX-CI-HEIGHT

   MAX-CHARS-HORIZONTAL

   MAX-CHARS-VERTICAL

   ;;Tick rate
   TICK-RATE

   ;;No Shot
   NO-SHOT
   ;; CIs
 
   ;;Aliens
   ALIEN-IMG

   ALIEN-IMG2

   ;;Shots
   SHOT-IMG

   SHOT-IMG2
 
   ;;Rockets
   ROCKET-IMG

   ROCKET-IMG2
 
   ;;DRAWING FUNCTIONS

   ;;Alien Drawing Functions
   draw-alien ;;default

   draw-alien-img ;;custom image
 
    ;;Shot Drawing Functions
   draw-shot ;;default

   draw-shot-img ;;custom image
 

   ;;Rocket Drawing Functions
   draw-rocket ;;default

   draw-rocket-img ;;custom image
 

   ;;Scene Drawing Functions
   draw-ci 

   ;;PROCESS-KEY FUNCTIONS
   
   ;;Rocket Move functions
   move-rckt-right

   move-rckt-left

   ;;Shot Creation Functions
   make-shot

   ;;PROCESS-TICK FUNCTIONS
   
   ;;Moving Functions
   move-right-image-x

   move-left-image-x

   move-down-image-y

   move-up-image-y
   
   ;;Alien Moving Functions
   move-alien-right

   move-alien-left

   move-alien-down

   ;;Shot Moving Functions
   move-shot-up


   ;;Direction Functions
   new-dir-after-down

   new-dir-after-left

   new-dir-after-right
   
   ;;Predicates

   ;;Image Predicates
   ci?

   ;;Shot Predicates
   hit?
   
   ;;Alien Predicates
   alien-at-right-edge?

   alien-at-left-edge?

   alien-reached-earth?
   )
