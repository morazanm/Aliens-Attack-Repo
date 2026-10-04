#lang racket/base

(require "../../ProcessTick/New-Direction-Functions.rkt"
         "../../Constants/E-Scene-Constants.rkt"
         "../../Constants/Alien-Constants.rkt"
         (only-in lang/htdp-beginner make-posn)
         (only-in rackunit check-equal?))



;; Tests using sample computations for new-dir-after-down
(check-equal? (new-dir-after-down RIGHT-EDGE-ALIEN) 'left)
(check-equal? (new-dir-after-down LEFT-EDGE-ALIEN) 'right)

;; Tests using sample values for new-dir-after-down
(check-equal? (new-dir-after-down (make-posn MIN-IMG-X 4)) 'right)
(check-equal? (new-dir-after-down (make-posn MAX-IMG-X 9)) 'left)


;; Tests using sample computations for new-dir-after-down
(check-equal? (new-dir-after-down EDGE-LOA2) 'left)
(check-equal? (new-dir-after-down EDGE-LOA) 'right)

;; Tests using sample values for new-dir-after-down
(check-equal? (new-dir-after-down (list (make-posn MIN-IMG-X 4))) 'right)
(check-equal? (new-dir-after-down (list (make-posn MAX-IMG-X 9))) 'left)


;; Tests using sample computations for new-dir-after-left
(check-equal? (new-dir-after-left LEFT-EDGE-ALIEN) 'down)
(check-equal? (new-dir-after-left INIT-ALIEN) 'left)

;; Tests using sample values for new-dir-after-left
(check-equal? (new-dir-after-left RIGHT-EDGE-ALIEN)'left)

;; Tests using sample computations for new-dir-after-left
(check-equal? (new-dir-after-left EDGE-LOA) 'down)
(check-equal? (new-dir-after-left INIT-LOA) 'left)

;; Tests using sample values for new-dir-after-left
(check-equal? (new-dir-after-left (list RIGHT-EDGE-ALIEN)) 'left)


;; Tests using sample computations for new-dir-after-right
(check-equal? (new-dir-after-right RIGHT-EDGE-ALIEN) 'down)
(check-equal? (new-dir-after-right INIT-ALIEN) 'right)

;; Tests using sample values for new-dir-after-right
(check-equal? (new-dir-after-right LEFT-EDGE-ALIEN) 'right)

;; Tests using sample computations for new-dir-after-right
(check-equal? (new-dir-after-right EDGE-LOA2) 'down)
(check-equal? (new-dir-after-right INIT-LOA) 'right)

;; Tests using sample values for new-dir-after-right
(check-equal? (new-dir-after-right (list LEFT-EDGE-ALIEN)) 'right)