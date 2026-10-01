#lang racket/base
(require "../Contracts/Contracts.rkt"
         racket/contract/region)

(provide (all-defined-out))


;; image-x<max -> image-x
;; Purpose: Move the given image-x<max right
(define/contract
  (move-right-image-x an-img-x<max)
  move-right-image-x/c
  (add1 an-img-x<max))


;; image-x>min -> image-x
;; Purpose: Move the given image-x>min left
(define/contract
  (move-left-image-x an-img-x>min)
  move-left-image-x/c
  (sub1 an-img-x>min))

;; image-y<max -> image-y
;; Purpose: To move the given image-y<max down
(define/contract
  (move-down-image-y an-img-y<max)
  move-down-image-y/c
  (add1 an-img-y<max))

;; image-y>min --> image-y
;; Purpose: To move the given image-y>min up
(define/contract (move-up-image-y an-img-y>min)
  move-down-image-y/c
  (sub1 an-img-y>min))
