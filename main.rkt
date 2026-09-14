(module main racket


  (require "./Constants/Constants.rkt"
           "./Drawing/Drawing-Functions.rkt"
           "./Predicates/Predicates.rkt"
           "./ProcessTick/ProcessTick-Functions.rkt"
           "./ProcessKey/ProcessKey-Functions.rkt"
           "./GameOver/GameOver-Functions.rkt")

  (provide
   ;;CONSTANTS

   ;;E-SCENE Constants
   E-SCENE
 
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
 

   ;;Scene Drawing Functions
 

   ;;Predicates

   ci?

   )
  )