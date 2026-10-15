#lang racket/base

(require "./Image-Predicates.rkt"
         "./Alien-Predicates.rkt"
         "./Shot-Predicates.rkt")

(provide

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
 )