#lang racket/base

(require (only-in rackunit check-false check-true check-pred check-equal?)
         (only-in lang/htdp-beginner empty? first rest posn? make-posn posn-y posn-x)
         "../../Predicates/Shot-Predicates.rkt"
         "../../Constants/E-SCENE-Constants.rkt"
         "../../Constants/Shot-Constants.rkt"
         "../../Constants/Alien-Constants.rkt")




;; Sample expressions for hit?
(define NHIT-VAL (and (posn? INIT-SHOT)
                      (= (posn-x INIT-SHOT) (posn-x INIT-ALIEN))
                      (= (posn-y INIT-SHOT) (posn-y INIT-ALIEN))))
(define HIT-VAL  (and (posn? SHOT3)
                      (= (posn-x SHOT3) (posn-x ALIEN3))
                      (= (posn-y SHOT3) (posn-y ALIEN3))))     

;; Tests using sample computations for hit?
(check-equal? (hit? INIT-SHOT INIT-ALIEN) NHIT-VAL)
(check-equal? (hit? SHOT3 ALIEN3) HIT-VAL)

;; Tests using sample values for hit?
(check-true (hit? (make-posn 0 0)  (make-posn 0 0)))
(check-false (hit? (make-posn 15 6) (make-posn 1 2)))
    
;; Sample expressions for hit-any-alien?
(define HIT-ANY-ALIEN0 (and (not (empty? E-LOA))
                            (or (hit? NO-SHOT (first E-LOA))
                                (hit-any-alien? NO-SHOT (rest E-LOA)))))
(define HIT-ANY-ALIEN1 (and (not (empty? E-LOA))
                            (or (hit? SHOT3 (first INIT-LOA))
                                (hit-any-alien? NO-SHOT (rest INIT-LOA)))))
(define HIT-ANY-ALIEN2 (and (not (empty? INIT-LOA))
                            (or (hit? NO-SHOT (first INIT-LOA))
                                (hit-any-alien? NO-SHOT (rest INIT-LOA)))))
(define HIT-ANY-ALIEN3 (and (not (empty? INIT-LOA))
                            (or (hit? SHOT5 (first INIT-LOA))
                                (hit-any-alien? SHOT5 (rest INIT-LOA)))))

;; Tests using sample computations for hit-any-alien?
(check-equal? (hit-any-alien? NO-SHOT E-LOA)    HIT-ANY-ALIEN0)
(check-equal? (hit-any-alien? SHOT3   E-LOA)    HIT-ANY-ALIEN1)
(check-equal? (hit-any-alien? NO-SHOT INIT-LOA) HIT-ANY-ALIEN2)
(check-equal? (hit-any-alien? SHOT5   INIT-LOA) HIT-ANY-ALIEN3)

;; Sample expressions for hit-by-any-shot?
(define HIT-LOS1-VAL (and (not (empty? LOS2))
                          (or (hit? (first LOS2) ALIEN-8-0)
                              (hit-by-any-shot? ALIEN-8-0 (rest LOS2)))))
(define HIT-LOS2-VAL (and (not (empty? INIT-LOS))
                          (or (hit? (first INIT-LOS) ALIEN-8-0)
                              (hit-by-any-shot? ALIEN-8-0 (rest INIT-LOS)))))

;; Tests using sample computations for hit-by-any-shot?
(check-equal? (hit-by-any-shot? ALIEN-8-0 LOS2)     HIT-LOS1-VAL)
(check-equal? (hit-by-any-shot? ALIEN-8-0 INIT-LOS) HIT-LOS2-VAL)

;; Tests using sample values for hit-by-any-shot?
(check-false (hit-by-any-shot? (make-posn 8 3) (list (make-posn 1 1) (make-posn 10 7))))
(check-true (hit-by-any-shot? (make-posn 10 7) (list (make-posn 1 1) (make-posn 10 7))))

;; Tests using sample values for hit-any-alien?
(check-true (hit-any-alien? (make-posn 9 3)
                            (list (make-posn 6 2)
                                  (make-posn 9 3)
                                  (make-posn 9 11))))
(check-false (hit-any-alien? (make-posn 11 3)
                             (list (make-posn 6 2)
                                   (make-posn 9 3)
                                   (make-posn 9 11))))
(check-false (hit-any-alien? NO-SHOT
                             (list (make-posn 6 2)
                                   (make-posn 9 3)
                                   (make-posn 9 11))))