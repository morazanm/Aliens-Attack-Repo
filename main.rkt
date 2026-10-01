#lang racket/base


(require "./Constants/Constants.rkt"
         "./Drawing/Drawing-Functions.rkt"
         "./Predicates/Predicates.rkt"
         "./ProcessTick/ProcessTick-Functions.rkt"
         "./ProcessKey/ProcessKey-Functions.rkt"
         (only-in "./Contracts/Contracts.rkt" image-x? image-y? dir? alien? rocket? shot? scene?)
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

   draw-loa ;;default

   draw-loa-img ;;custom image

   ;;Shot Drawing Functions
   draw-shot ;;default

   draw-shot-img ;;custom image

   draw-los ;;default

   draw-los-img ;;custom image

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

   move-loa

   remove-hit-aliens

   ;;Shot Moving Functions
   move-shot-up

   move-los
   
   remove-shots
   
   ;;Direction Functions
   new-dir-after-down

   new-dir-after-left

   new-dir-after-right
   
   ;;Predicates

   ;;Image Predicates
   ci?

   ;;Alien Predicates
   alien-at-right-edge?

   any-alien-at-right-edge?

   alien-at-left-edge?

   any-alien-at-left-edge?

   alien-reached-earth?

   any-alien-reached-earth?

   any-aliens-alive?

   ;;Shot Predicates
   hit?

   hit-by-any-shot?

   hit-any-alien?
   
   ;;Shot Predicates
   hit?   


   ;;Other Preds
   shot?

   rocket?

   alien?

   dir?

   image-x?

   image-y?

   scene?
   )
