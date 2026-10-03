#lang racket/base

(require (only-in lang/htdp-beginner make-posn)
         "./E-SCENE-Constants.rkt")

(provide (all-defined-out))

(define NO-SHOT 'no-shot)

(define INIT-SHOT NO-SHOT)
(define SHOT2     (make-posn (/ MAX-CHARS-HORIZONTAL 2) (/ (sub1 MAX-CHARS-VERTICAL) 2)))
(define SHOT3     (make-posn 4 MAX-IMG-Y))
(define SHOT4     (make-posn 14 MIN-IMG-Y))
(define SHOT5 (make-posn 11 1))


(define INIT-LOS '())
(define LOS2 (list (make-posn 8 0) (make-posn 10 5)))

