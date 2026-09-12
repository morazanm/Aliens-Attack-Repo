#lang racket/base

(require 2htdp/image
         "./Image-Constants.rkt")

(provide (all-defined-out))


(define MAX-CHARS-HORIZONTAL 20)

(define MAX-CHARS-VERTICAL 15)

(define E-SCENE-W (* MAX-CHARS-HORIZONTAL IMAGE-WIDTH))

(define E-SCENE-H (* MAX-CHARS-VERTICAL IMAGE-HEIGHT))

(define E-SCENE-COLOR 'pink)

(define E-SCENE (empty-scene E-SCENE-W E-SCENE-H E-SCENE-COLOR))

;; Sample image-x
(define AN-IMG-X (/ MAX-CHARS-HORIZONTAL 2))

(define MIN-IMG-X 0)

(define MAX-IMG-X (sub1 MAX-CHARS-HORIZONTAL))

;; Sample image-y
(define AN-IMG-Y (/ MAX-CHARS-VERTICAL 2))

(define MIN-IMG-Y 0)

(define MAX-IMG-Y (sub1 MAX-CHARS-VERTICAL))