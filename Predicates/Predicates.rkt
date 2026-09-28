#lang racket/base

(require "./Image-Predicates.rkt"
         "./Alien-Predicates.rkt")

(provide

 ;;Image Predicates
 ci?

 ;;Alien Predicates
 alien-at-right-edge?

 alien-at-left-edge?

 alien-reached-earth?
 )