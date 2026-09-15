#lang racket/base


(require "./Constants/Constants.rkt"
           "./Drawing/Drawing-Functions.rkt"
           "./Predicates/Predicates.rkt"
           "./ProcessTick/ProcessTick-Functions.rkt"
           "./ProcessKey/ProcessKey-Functions.rkt"
           "./GameOver/GameOver-Functions.rkt")

  (provide
   ;;CONSTANTS
   
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
 

   ;;Shot Drawing Functions
 

   ;;Rocket Drawing Functions
   draw-rocket ;;default

   draw-rocket-img ;;custom image
 

   ;;Scene Drawing Functions
   draw-ci 

   ;;PROCESS-KEY FUNCTIONS
   
   ;;Rocket Move functions
   move-rckt-right

   move-rckt-left
   
   ;;Predicates

   ci?

   )
