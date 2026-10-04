#lang racket/base

(require (only-in lang/htdp-beginner make-posn)
         "./E-SCENE-Constants.rkt")

(provide (all-defined-out))

(define INIT-ALIEN (make-posn AN-IMG-X 0))
(define INIT-ALIEN2 (make-posn 3 MAX-IMG-Y))
(define LEFT-EDGE-ALIEN  (make-posn MIN-IMG-X 10))
(define RIGHT-EDGE-ALIEN (make-posn MAX-IMG-X 6))
(define ALIEN3 (make-posn 4 MAX-IMG-Y))
(define ALIEN-8-0 (make-posn 8 0))


(define E-LOA '())
(define EDGE-LOA  (list ALIEN-8-0  LEFT-EDGE-ALIEN (make-posn 5 5)))
(define EDGE-LOA2 (list (make-posn 1 11) RIGHT-EDGE-ALIEN))
(define INIT-LOA (list (make-posn 8 0) (make-posn 9 0) (make-posn 10 0) (make-posn 11 0) (make-posn 12 0) (make-posn 13 0)
                       (make-posn 8 1) (make-posn 9 1) (make-posn 10 1) (make-posn 11 1) (make-posn 12 1) (make-posn 13 1)
                       (make-posn 8 2) (make-posn 9 2) (make-posn 10 2) (make-posn 11 2) (make-posn 12 2) (make-posn 13 2)))
(define EARTH-REACHED-LOA (list (make-posn 1 11) (make-posn MAX-IMG-X MAX-IMG-Y)))
(define LOA3 (list (make-posn 1 9) (make-posn 8 0)))
(define LOA4 (list (make-posn 1 9) (make-posn 8 5)))

