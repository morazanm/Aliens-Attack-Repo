#lang racket/base

(provide (all-defined-out))


;; image-x<max -> image-x
;; Purpose: Move the given image-x<max right
(define (move-right-image-x an-img-x<max) (add1 an-img-x<max))


;; image-x>min -> image-x
;; Purpose: Move the given image-x>min left
(define (move-left-image-x an-img-x>min) (sub1 an-img-x>min))

;; image-y<max -> image-y
;; Purpose: To move the given image-y<max down
(define (move-down-image-y an-img-y<max) (add1 an-img-y<max))