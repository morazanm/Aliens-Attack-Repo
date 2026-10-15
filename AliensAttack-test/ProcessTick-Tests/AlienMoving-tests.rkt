#lang racket/base

(require "../../ProcessTick/Alien-Moving-Functions.rkt"
         "../../ProcessTick/Tick-Moving-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Alien-Constants.rkt"
         (only-in lang/htdp-beginner rest first cons make-posn posn-x posn-y)
         (only-in rackunit check-equal?))


;;Tests for move-alien-right
(check-equal? (move-alien-right INIT-ALIEN) (make-posn (move-right-image-x (posn-x INIT-ALIEN))
                                                       (posn-y INIT-ALIEN)))

(check-equal? (move-alien-right INIT-ALIEN2) (make-posn (move-right-image-x (posn-x INIT-ALIEN2))
                                                        (posn-y INIT-ALIEN2)))

;;Tests for move-alien-left
(check-equal? (move-alien-left INIT-ALIEN) (make-posn (move-left-image-x (posn-x INIT-ALIEN))
                                                      (posn-y INIT-ALIEN)))

(check-equal? (move-alien-left INIT-ALIEN2) (make-posn (move-left-image-x (posn-x INIT-ALIEN2))
                                                       (posn-y INIT-ALIEN2)))

;;Tests for move-alien-down
(check-equal? (move-alien-down INIT-ALIEN) (make-posn (posn-x INIT-ALIEN)
                                                      (move-down-image-y (posn-y INIT-ALIEN))))

(check-equal? (move-alien-down (make-posn 1 8)) (make-posn (posn-x (make-posn 1 8))
                                                           (move-down-image-y (posn-y (make-posn 1 8)))))

;; Tests using sample computations for move-alien
(check-equal? (move-alien INIT-ALIEN  'right) (move-alien-right INIT-ALIEN))
(check-equal? (move-alien INIT-ALIEN2  'right) (move-alien-right INIT-ALIEN2))
(check-equal? (move-alien INIT-ALIEN  'left)  (move-alien-left INIT-ALIEN))
(check-equal? (move-alien INIT-ALIEN2 'left)  (move-alien-left INIT-ALIEN2))
(check-equal? (move-alien INIT-ALIEN  'down)  (move-alien-down INIT-ALIEN))
(check-equal? (move-alien (make-posn 1 8) 'down)  (move-alien-down (make-posn 1 8)))

;; Tests using sample values for move-alien
(check-equal? (move-alien (make-posn MAX-IMG-X 3) 'down)
              (make-posn MAX-IMG-X 4))
(check-equal? (move-alien (make-posn MAX-IMG-X 3) 'left)
              (make-posn (sub1 MAX-IMG-X) 3))
(check-equal? (move-alien (make-posn 0 5) 'right)
              (make-posn 1 5))

;; Tests using sample computations for move-loa
(check-equal? (move-loa E-LOA 'right) E-LOA)
(check-equal? (move-loa INIT-LOA 'left)
              (cons (move-alien (first INIT-LOA) 'left)
                    (move-loa (rest INIT-LOA) 'left)))
(check-equal? (move-loa LOA3 'right)
              (cons (move-alien (first LOA3) 'right)
                    (move-loa (rest LOA3) 'right)))
(check-equal? (move-loa LOA4 'down)
              (cons (move-alien (first LOA4) 'down)
                    (move-loa (rest LOA4) 'down)))

;; Tests using sample values for move-loa
(check-equal? (move-loa (cons (make-posn 1 1)
                              (cons (make-posn 1 2) '()))
                        'right)
              (cons (make-posn 2 1)
                    (cons (make-posn 2 2) '())))

(check-equal? (move-loa (cons (make-posn 1 1)
                              (cons (make-posn 1 2) '()))
                        'left)
              (cons (make-posn 0 1)
                    (cons (make-posn 0 2) '())))
(check-equal? (move-loa (cons (make-posn 1 1)
                              (cons (make-posn 1 2) '()))
                        'down)
              (cons (make-posn 1 2)
                    (cons (make-posn 1 3) '())))
