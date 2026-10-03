#lang racket/base

(require (only-in rackunit check-false check-true check-pred check-equal?)
         (only-in lang/htdp-beginner empty? first rest make-posn posn-y posn-x)
         "../../Constants/Alien-Constants.rkt"
         "../../Predicates/Alien-Predicates.rkt"
         "../../Constants/E-SCENE-Constants.rkt")


;; Sample expressions for alien-at-right-edge?
(define REDGE-VAL1 (= (posn-x INIT-ALIEN) MAX-IMG-X))
(define REDGE-VAL2 (= (posn-x (make-posn MAX-IMG-X 8)) MAX-IMG-X))

;; Tests using sample computations for alien-at-right-edge?
(check-equal? (alien-at-right-edge? INIT-ALIEN)       REDGE-VAL1)
(check-equal? (alien-at-right-edge? RIGHT-EDGE-ALIEN) REDGE-VAL2)

;; Tests using sample values for alien-at-right-edge?
(check-false (alien-at-right-edge? (make-posn 1 1)))
(check-true (alien-at-right-edge? RIGHT-EDGE-ALIEN))

;; Sample expressions for any-alien-at-right-edge?
(define EDGE-E-LOA-VAL    (and (not (empty? E-LOA))
                               (or (alien-at-right-edge?     (first E-LOA))
                                   (any-alien-at-right-edge? (rest E-LOA)))))

(define EDGE-INIT-LOA-VAL (and (not (empty? INIT-LOA))
                               (or (alien-at-right-edge?     (first INIT-LOA))
                                   (any-alien-at-right-edge? (rest INIT-LOA)))))

(define EDGE-LOA-VAL (and (not (empty? EDGE-LOA))
                          (or (alien-at-right-edge?     (first EDGE-LOA))
                              (any-alien-at-right-edge? (rest EDGE-LOA)))))

(define EDGE-LOA2-VAL (and (not (empty? EDGE-LOA2))
                           (or (alien-at-right-edge?     (first EDGE-LOA2))
                               (any-alien-at-right-edge? (rest EDGE-LOA2)))))

;; Tests using sample computations any-alien-at-right-edge?
(check-equal? (any-alien-at-right-edge? E-LOA)     EDGE-E-LOA-VAL)
(check-equal? (any-alien-at-right-edge? INIT-LOA)  EDGE-INIT-LOA-VAL)
(check-equal? (any-alien-at-right-edge? EDGE-LOA)  EDGE-LOA-VAL)
(check-equal? (any-alien-at-right-edge? EDGE-LOA2) EDGE-LOA2-VAL)

;; Tests using sample values for any-alien-at-right-edge?
(check-true (any-alien-at-right-edge? (list (make-posn MIN-IMG-X 8)
                                            (make-posn 6 3)
                                            (make-posn MAX-IMG-X 10))))
(check-true (any-alien-at-right-edge? (list (make-posn 3  8)
                                            (make-posn MAX-IMG-X  3)
                                            (make-posn 5 2))))
(check-false (any-alien-at-right-edge? (list (make-posn MIN-IMG-Y  8))))
(check-false (any-alien-at-right-edge? (list (make-posn 3  8)
                                             (make-posn 5 2))))


;; Sample expressions for alien-at-left-edge?
(define LEDGE-VAL1 (= (posn-x INIT-ALIEN) MIN-IMG-X))
(define LEDGE-VAL2 (= (posn-x LEFT-EDGE-ALIEN) MIN-IMG-X))

;; Tests using sample computations for alien-at-left-edge?
(check-equal? (alien-at-left-edge? INIT-ALIEN) LEDGE-VAL1)
(check-equal? (alien-at-left-edge? LEFT-EDGE-ALIEN) LEDGE-VAL2)

;; Tests using sample values for alien-at-left-edge?
(check-false (alien-at-left-edge? (make-posn 3 2)))
(check-true (alien-at-left-edge? (make-posn MIN-IMG-X 8)))
    
;; Sample expressions for any-alien-at-left-edge?
(define LEDGE-E-LOA-VAL    (and (not (empty? E-LOA))
                                (or (alien-at-left-edge?     (first E-LOA))
                                    (any-alien-at-left-edge? (rest E-LOA)))))

(define LEDGE-INIT-LOA-VAL (and (not (empty? INIT-LOA))
                                (or (alien-at-left-edge?     (first INIT-LOA))
                                    (any-alien-at-left-edge? (rest INIT-LOA)))))

(define LEDGE-LOA-VAL (and (not (empty? EDGE-LOA))
                           (or (alien-at-left-edge?     (first EDGE-LOA))
                               (any-alien-at-left-edge? (rest EDGE-LOA)))))

(define LEDGE-LOA2-VAL (and (not (empty? EDGE-LOA2))
                            (or (alien-at-left-edge?     (first EDGE-LOA2))
                                (any-alien-at-left-edge? (rest EDGE-LOA2)))))

;; Tests using sample computations any-alien-at-left-edge?
(check-equal? (any-alien-at-left-edge? E-LOA)    LEDGE-E-LOA-VAL)
(check-equal? (any-alien-at-left-edge? INIT-LOA) LEDGE-INIT-LOA-VAL)
(check-equal? (any-alien-at-left-edge? EDGE-LOA) LEDGE-LOA-VAL)
(check-equal? (any-alien-at-left-edge? EDGE-LOA2) LEDGE-LOA2-VAL)

;; Tests using sample values for any-alien-at-left-edge?
(check-true (any-alien-at-left-edge? (list (make-posn MIN-IMG-X 8)
                                           (make-posn 6 3)
                                           (make-posn MAX-IMG-X 10))))
(check-true (any-alien-at-left-edge? (list (make-posn 3  8)
                                           (make-posn MIN-IMG-X 3)
                                           (make-posn 5 2))))
(check-false (any-alien-at-left-edge? (list (make-posn MAX-IMG-Y 8))))
(check-false (any-alien-at-left-edge? (list (make-posn 3 8)
                                            (make-posn 5 2))))

;; Sample expressions for alien-reached-earth?
(define ALIEN-EARTH1 (= (posn-y INIT-ALIEN)  MAX-IMG-Y))
(define ALIEN-EARTH2 (= (posn-y INIT-ALIEN2) MAX-IMG-Y))

;; Tests using sample computations for alien-reached-earth?
(check-equal? (alien-reached-earth? INIT-ALIEN)  ALIEN-EARTH1)
(check-equal? (alien-reached-earth? INIT-ALIEN2) ALIEN-EARTH2)

;; Tests using sample values for alien-reached-earth?
(check-false (alien-reached-earth? (make-posn 14 0)))
(check-true (alien-reached-earth? (make-posn 9 MAX-IMG-Y)))

;; Sample expressions for any-alien-reached-earth?
(define ANY-REACHED-VAL1 (and (not (empty? E-LOA))
                              (or (alien-reached-earth? (first E-LOA))
                                  (any-alien-reached-earth? (rest E-LOA)))))
(define ANY-REACHED-VAL2 (and (not (empty? INIT-LOA))
                              (or (alien-reached-earth? (first INIT-LOA))
                                  (any-alien-reached-earth? (rest INIT-LOA)))))
(define ANY-REACHED-VAL3 (and (not (empty? EARTH-REACHED-LOA))
                              (or (alien-reached-earth? (first EARTH-REACHED-LOA))
                                  (any-alien-reached-earth? (rest EARTH-REACHED-LOA)))))

;; Tests using sample computations for any-alien-reached-earth?
(check-equal? (any-alien-reached-earth? E-LOA)             ANY-REACHED-VAL1)
(check-equal? (any-alien-reached-earth? INIT-LOA)          ANY-REACHED-VAL2)
(check-equal? (any-alien-reached-earth? EARTH-REACHED-LOA) ANY-REACHED-VAL3)

;; Tests using sample values for any-alien-reached-earth?
(check-true (any-alien-reached-earth? (list (make-posn 3 MAX-IMG-Y)
                                            (make-posn 7 5)
                                            (make-posn 8 2))))
(check-false (any-alien-reached-earth? (list (make-posn 3 12)
                                             (make-posn 7 5)
                                             (make-posn 8 2))))

;; Sample expressions for any-aliens-alive?
(define NOT-ALIVE-VAL (not (empty? E-LOA)))
(define ALIVE-VAL     (not (empty? INIT-LOA)))

;; Tests using sample computations any-aliens-alive?
(check-equal? (any-aliens-alive? E-LOA)    NOT-ALIVE-VAL)
(check-equal? (any-aliens-alive? INIT-LOA) ALIVE-VAL)

;; Tests using sample values for any-aliens-alive?
(check-false (any-aliens-alive? '()))
(check-true (any-aliens-alive? (list (make-posn 9 2) (make-posn 6 4))) )